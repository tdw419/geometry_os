; DESCRIPTION: Creates a purple rectangular region at (348, 19) spanning 91 by 81 pixels.
; PLAN: r0=348(x), r1=19(y), r2=91(width), r3=81(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 348
LDI r1, 19
LDI r2, 91
LDI r3, 81
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
