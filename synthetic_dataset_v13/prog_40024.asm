; DESCRIPTION: Draws a purple circle centered at (253, 86) with radius 45.
; PLAN: r0=253(x), r1=86(y), r2=45(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 253
LDI r1, 86
LDI r2, 45
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
