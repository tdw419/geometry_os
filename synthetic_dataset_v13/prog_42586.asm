; DESCRIPTION: Draws a purple circle centered at (293, 170) with radius 74.
; PLAN: r0=293(x), r1=170(y), r2=74(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 293
LDI r1, 170
LDI r2, 74
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
