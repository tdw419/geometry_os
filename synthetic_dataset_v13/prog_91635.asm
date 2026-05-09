; DESCRIPTION: Draws a blue circle centered at (137, 150) with radius 38.
; PLAN: r0=137(x), r1=150(y), r2=38(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 137
LDI r1, 150
LDI r2, 38
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
