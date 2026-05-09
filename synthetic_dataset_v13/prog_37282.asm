; DESCRIPTION: Draws a magenta circle centered at (282, 201) with radius 20.
; PLAN: r0=282(x), r1=201(y), r2=20(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 282
LDI r1, 201
LDI r2, 20
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
