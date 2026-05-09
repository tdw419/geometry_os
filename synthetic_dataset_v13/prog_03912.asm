; DESCRIPTION: Draws a purple circle centered at (454, 217) with radius 17.
; PLAN: r0=454(x), r1=217(y), r2=17(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 454
LDI r1, 217
LDI r2, 17
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
