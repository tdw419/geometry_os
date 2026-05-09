; DESCRIPTION: Draws a blue circle centered at (371, 145) with radius 66.
; PLAN: r0=371(x), r1=145(y), r2=66(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 371
LDI r1, 145
LDI r2, 66
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
