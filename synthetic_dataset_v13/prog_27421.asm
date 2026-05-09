; DESCRIPTION: Draws a blue circle centered at (348, 201) with radius 36.
; PLAN: r0=348(x), r1=201(y), r2=36(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 348
LDI r1, 201
LDI r2, 36
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
