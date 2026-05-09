; DESCRIPTION: Creates a red rectangular region at (348, 63) spanning 100 by 106 pixels.
; PLAN: r0=348(x), r1=63(y), r2=100(width), r3=106(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 348
LDI r1, 63
LDI r2, 100
LDI r3, 106
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
