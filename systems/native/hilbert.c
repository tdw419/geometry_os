#include "hilbert.h"

// --- 2D Implementation (Existing) ---

static void rot2d(int n, int *x, int *y, int rx, int ry) {
    if (ry == 0) {
        if (rx == 1) {
            *x = n - 1 - *x;
            *y = n - 1 - *y;
        }
        int t = *x;
        *x = *y;
        *y = t;
    }
}

void hilbert_d2xy(int n, uint32_t d, int *x, int *y) {
    int rx, ry, s, t = d;
    *x = *y = 0;
    for (s = 1; s < n; s *= 2) {
        rx = 1 & (t / 2);
        ry = 1 & (t ^ rx);
        rot2d(s, x, y, rx, ry);
        *x += s * rx;
        *y += s * ry;
        t /= 4;
    }
}

uint32_t hilbert_xy2d(int n, int x, int y) {
    int rx, ry, s, d = 0;
    for (s = n / 2; s > 0; s /= 2) {
        rx = (x & s) > 0;
        ry = (y & s) > 0;
        d += s * s * ((3 * rx) ^ ry);
        rot2d(s, &x, &y, rx, ry);
    }
    return d;
}

// --- 3D Implementation (New: The Holographic Substrate) ---

/**
 * 3D Hilbert mapping based on Moore's algorithm
 * Mapping 1D distance 'd' to (x, y, z)
 */
void hilbert_d2xyz(int n, uint64_t d, int *x, int *y, int *z) {
    *x = *y = *z = 0;
    uint64_t t = d;
    for (int s = 1; s < n; s *= 2) {
        int rx = 1 & (t / 4);
        int ry = 1 & (t / 2);
        int rz = 1 & (t ^ ry);
        
        // Moore 3D rotation logic
        if (rz == 0) {
            if (ry == 0) {
                if (rx == 0) {
                    int tmp = *x; *x = *z; *z = *y; *y = tmp;
                } else {
                    int tmp = *x; *x = n - 1 - *z; *z = n - 1 - *y; *y = tmp;
                }
            } else {
                if (rx == 0) {
                    int tmp = *x; *x = *y; *y = *z; *z = tmp;
                } else {
                    int tmp = *x; *x = n - 1 - *y; *y = n - 1 - *z; *z = tmp;
                }
            }
        }
        
        *x += s * rx;
        *y += s * ry;
        *z += s * rz;
        t /= 8;
    }
}

uint64_t hilbert_xyz2d(int n, int x, int y, int z) {
    // Inverse 3D mapping (Simplified recursive form)
    // In production, we use a precomputed LUT for O(1) performance
    // This provides the foundational logic for the LUT generator.
    uint64_t d = 0;
    for (int s = n / 2; s > 0; s /= 2) {
        int rx = (x & s) > 0;
        int ry = (y & s) > 0;
        int rz = (z & s) > 0;
        d += (uint64_t)s * s * s * ((rx * 4) + (ry * 2) + (rz ^ ry));
        // Inverse rotations here... (Placeholder for full inverse Moore)
    }
    return d;
}
