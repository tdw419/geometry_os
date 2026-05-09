; DESCRIPTION: Draws a blue circle centered at (471, 106) with radius 20.
; PLAN: r0=471(x), r1=106(y), r2=20(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 471
LDI r1, 106
LDI r2, 20
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
