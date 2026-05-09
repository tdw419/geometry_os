; DESCRIPTION: Draws a purple circle centered at (371, 166) with radius 35.
; PLAN: r0=371(x), r1=166(y), r2=35(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 371
LDI r1, 166
LDI r2, 35
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
