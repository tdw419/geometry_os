; DESCRIPTION: Draws a magenta circle centered at (273, 201) with radius 37.
; PLAN: r0=273(x), r1=201(y), r2=37(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 273
LDI r1, 201
LDI r2, 37
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
