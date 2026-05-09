; DESCRIPTION: Creates a red rectangular region at (348, 219) spanning 88 by 32 pixels.
; PLAN: r0=348(x), r1=219(y), r2=88(width), r3=32(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 348
LDI r1, 219
LDI r2, 88
LDI r3, 32
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
