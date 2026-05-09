; DESCRIPTION: Draws a magenta circle centered at (389, 136) with radius 54.
; PLAN: r0=389(x), r1=136(y), r2=54(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 389
LDI r1, 136
LDI r2, 54
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
