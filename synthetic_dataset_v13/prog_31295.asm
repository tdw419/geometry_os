; DESCRIPTION: Draws a purple circle centered at (83, 172) with radius 63.
; PLAN: r0=83(x), r1=172(y), r2=63(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 83
LDI r1, 172
LDI r2, 63
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
