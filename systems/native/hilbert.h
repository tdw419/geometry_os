#ifndef HILBERT_H
#define HILBERT_H

#include <stdint.h>
#include <stddef.h>

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

// ============================================================================
// BATCH OPERATIONS - SIMD Optimized
// ============================================================================

/**
 * Batch convert 1D indices to 2D coordinates.
 * Optimized for cache locality and auto-vectorization.
 * 
 * @param n Grid size (must be power of 2)
 * @param indices Array of 1D indices
 * @param xs Output array for x coordinates (must be pre-allocated, size=count)
 * @param ys Output array for y coordinates (must be pre-allocated, size=count)
 * @param count Number of indices to convert
 */
void hilbert_batch_d2xy(int n, const uint32_t *indices, int *xs, int *ys, size_t count);

/**
 * Batch convert 2D coordinates to 1D indices.
 * 
 * @param n Grid size (must be power of 2)
 * @param xs Array of x coordinates
 * @param ys Array of y coordinates
 * @param results Output array for 1D indices (must be pre-allocated, size=count)
 * @param count Number of coordinates to convert
 */
void hilbert_batch_xy2d(int n, const int *xs, const int *ys, uint32_t *results, size_t count);

#ifdef __cplusplus
}
#endif

#endif // HILBERT_H
