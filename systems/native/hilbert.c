#include "hilbert.h"

// Rotate and flip a quadrant appropriately
static void rot(int n, int *x, int *y, int rx, int ry) {
    if (ry == 0) {
        if (rx == 1) {
            *x = n - 1 - *x;
            *y = n - 1 - *y;
        }
        // Swap x and y
        int t = *x;
        *x = *y;
        *y = t;
    }
}

/**
 * hilbert_d2xy: Map 1D distance 'd' to 2D coordinates (x, y)
 * n: order of the curve (grid size is n x n, n must be power of 2)
 * d: 1D distance (0 to n*n - 1)
 */
void hilbert_d2xy(int n, uint32_t d, int *x, int *y) {
    int rx, ry, s, t = d;
    *x = *y = 0;
    for (s = 1; s < n; s *= 2) {
        rx = 1 & (t / 2);
        ry = 1 & (t ^ rx);
        rot(s, x, y, rx, ry);
        *x += s * rx;
        *y += s * ry;
        t /= 4;
    }
}

/**
 * hilbert_xy2d: Map 2D coordinates (x, y) to 1D distance 'd'
 * n: order of the curve (grid size)
 */
uint32_t hilbert_xy2d(int n, int x, int y) {
    int rx, ry, s, d = 0;
    for (s = n / 2; s > 0; s /= 2) {
        rx = (x & s) > 0;
        ry = (y & s) > 0;
        d += s * s * ((3 * rx) ^ ry);
        rot(s, &x, &y, rx, ry);
    }
    return d;
}
