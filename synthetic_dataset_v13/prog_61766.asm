; DESCRIPTION: Draws a magenta circle centered at (311, 124) with radius 29.
; PLAN: r0=311(x), r1=124(y), r2=29(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 311
LDI r1, 124
LDI r2, 29
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
