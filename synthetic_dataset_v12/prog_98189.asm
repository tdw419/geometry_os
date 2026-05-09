; DESCRIPTION: Creates a red rectangular region at (348, 219) spanning 83 by 34 pixels.
; PLAN: r0=348(x), r1=219(y), r2=83(width), r3=34(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 348
LDI r1, 219
LDI r2, 83
LDI r3, 34
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
