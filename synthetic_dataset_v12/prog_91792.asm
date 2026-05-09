; DESCRIPTION: Draws a blue circle centered at (371, 153) with radius 37.
; PLAN: r0=371(x), r1=153(y), r2=37(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 371
LDI r1, 153
LDI r2, 37
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
