; DESCRIPTION: Draws a purple circle centered at (371, 17) with radius 15.
; PLAN: r0=371(x), r1=17(y), r2=15(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 371
LDI r1, 17
LDI r2, 15
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
