; DESCRIPTION: Draws a purple circle centered at (348, 85) with radius 77.
; PLAN: r0=348(x), r1=85(y), r2=77(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 348
LDI r1, 85
LDI r2, 77
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
