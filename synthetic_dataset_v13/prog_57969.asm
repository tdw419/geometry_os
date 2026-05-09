; DESCRIPTION: Creates a white rectangular region at (429, 13) spanning 81 by 64 pixels.
; PLAN: r0=429(x), r1=13(y), r2=81(width), r3=64(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 429
LDI r1, 13
LDI r2, 81
LDI r3, 64
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
