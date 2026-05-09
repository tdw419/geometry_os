; DESCRIPTION: Draws a purple circle centered at (139, 198) with radius 44.
; PLAN: r0=139(x), r1=198(y), r2=44(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 139
LDI r1, 198
LDI r2, 44
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
