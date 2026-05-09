; DESCRIPTION: Draws a purple circle centered at (183, 201) with radius 40.
; PLAN: r0=183(x), r1=201(y), r2=40(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 183
LDI r1, 201
LDI r2, 40
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
