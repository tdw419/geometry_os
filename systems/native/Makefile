CC = gcc
CFLAGS = -O3 -fPIC -Wall -march=native -ffast-math -funroll-loops
LDFLAGS = -shared

all: libhilbert.so

libhilbert.so: hilbert.c hilbert.h
	$(CC) $(CFLAGS) $(LDFLAGS) -o libhilbert.so hilbert.c

clean:
	rm -f *.so *.o

.PHONY: all clean
