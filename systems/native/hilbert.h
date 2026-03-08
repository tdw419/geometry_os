#ifndef HILBERT_H
#define HILBERT_H

#include <stdint.h>

#ifdef __cplusplus
extern "C" {
#endif

// Map 1D distance 'd' to 2D coordinates (x, y) on a Hilbert curve of order 'n' (grid size 2^n)
void hilbert_d2xy(int n, uint32_t d, int *x, int *y);

// Map 2D coordinates (x, y) to 1D distance 'd' on a Hilbert curve of order 'n'
uint32_t hilbert_xy2d(int n, int x, int y);

#ifdef __cplusplus
}
#endif

#endif // HILBERT_H
