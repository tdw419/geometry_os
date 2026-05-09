; DESCRIPTION: Draws a black circle centered at (371, 185) with radius 65.
; PLAN: r0=371(x), r1=185(y), r2=65(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 371
LDI r1, 185
LDI r2, 65
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
