; DESCRIPTION: Draws a blue circle centered at (87, 110) with radius 63.
; PLAN: r0=87(x), r1=110(y), r2=63(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 87
LDI r1, 110
LDI r2, 63
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
