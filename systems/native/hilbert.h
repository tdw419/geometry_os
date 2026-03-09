#ifndef HILBERT_H
#define HILBERT_H

#include <stdint.h>

#ifdef __cplusplus
extern "C" {
#endif

// 2D Hilbert Curve
void hilbert_d2xy(int n, uint32_t d, int *x, int *y);
uint32_t hilbert_xy2d(int n, int x, int y);

// 3D Hilbert Curve (The Holographic Substrate)
// n: grid size (must be power of 2)
// d: 1D distance (0 to n^3 - 1)
void hilbert_d2xyz(int n, uint64_t d, int *x, int *y, int *z);
uint64_t hilbert_xyz2d(int n, int x, int y, int z);

#ifdef __cplusplus
}
#endif

#endif // HILBERT_H
