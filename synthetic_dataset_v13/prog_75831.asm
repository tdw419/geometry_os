; DESCRIPTION: Draws a magenta circle centered at (411, 139) with radius 22.
; PLAN: r0=411(x), r1=139(y), r2=22(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 411
LDI r1, 139
LDI r2, 22
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
