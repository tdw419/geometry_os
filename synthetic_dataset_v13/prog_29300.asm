; DESCRIPTION: Draws a blue circle centered at (206, 110) with radius 58.
; PLAN: r0=206(x), r1=110(y), r2=58(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 206
LDI r1, 110
LDI r2, 58
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
