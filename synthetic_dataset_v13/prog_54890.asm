; DESCRIPTION: Creates a purple rectangular region at (348, 3) spanning 19 by 106 pixels.
; PLAN: r0=348(x), r1=3(y), r2=19(width), r3=106(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 348
LDI r1, 3
LDI r2, 19
LDI r3, 106
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
