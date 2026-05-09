; DESCRIPTION: Draws a blue circle centered at (311, 139) with radius 51.
; PLAN: r0=311(x), r1=139(y), r2=51(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 311
LDI r1, 139
LDI r2, 51
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
