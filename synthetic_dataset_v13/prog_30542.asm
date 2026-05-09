; DESCRIPTION: Draws a black circle centered at (348, 217) with radius 35.
; PLAN: r0=348(x), r1=217(y), r2=35(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 348
LDI r1, 217
LDI r2, 35
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
