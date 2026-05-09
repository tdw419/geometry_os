; DESCRIPTION: Draws a magenta circle centered at (302, 121) with radius 75.
; PLAN: r0=302(x), r1=121(y), r2=75(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 302
LDI r1, 121
LDI r2, 75
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
