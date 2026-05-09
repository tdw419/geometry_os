; DESCRIPTION: Draws a magenta circle centered at (297, 89) with radius 59.
; PLAN: r0=297(x), r1=89(y), r2=59(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 297
LDI r1, 89
LDI r2, 59
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
