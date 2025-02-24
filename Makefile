CC = g++
CFLAGS = -Wall -g -std=c++11
SOURCES = src/main.cpp src/locacao.cpp src/formatacao.cpp src/Cliente/cliente.cpp src/Filme/blueray.cpp src/Filme/dvd.cpp src/Filme/fita.cpp src/Filme/filme.cpp src/sistema.cpp
HEADERS = include/bluray.hpp include/cliente.hpp include/dvd.hpp include/filme.hpp include/fita.hpp include/locacao.hpp include/formatacao.hpp include/sistema.hpp
OBJECTS = $(SOURCES:.cpp=.o)
BUILD_DIR = ./build
INCLUDE_DIR = ./include
EXECUTABLE = main

# Outras regras do Makefile...

# Regra para gerar a documentação com o Doxygen
doc:
	doxygen Doxyfile

# Regra para abrir o arquivo index.html após a geração da documentação
open-doc: doc
	@start cmd /c start "" doc\html\index.html

$(EXECUTABLE): $(OBJECTS)
	$(CC) $(CFLAGS) -I $(INCLUDE_DIR) $(OBJECTS) -o $(EXECUTABLE)

%.o: %.cpp $(HEADERS)
	$(CC) $(CFLAGS) -I $(INCLUDE_DIR) -c $< -o $@

clean:
	rm -f $(OBJECTS) $(EXECUTABLE)

.PHONY: all clean
