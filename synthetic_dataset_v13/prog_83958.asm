; DESCRIPTION: Draws a purple circle centered at (144, 199) with radius 44.
; PLAN: r0=144(x), r1=199(y), r2=44(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 144
LDI r1, 199
LDI r2, 44
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
