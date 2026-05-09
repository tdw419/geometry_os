; DESCRIPTION: Draws a magenta circle centered at (311, 201) with radius 41.
; PLAN: r0=311(x), r1=201(y), r2=41(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 311
LDI r1, 201
LDI r2, 41
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
