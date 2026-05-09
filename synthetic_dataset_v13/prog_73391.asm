; DESCRIPTION: Draws a magenta circle centered at (463, 119) with radius 34.
; PLAN: r0=463(x), r1=119(y), r2=34(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 463
LDI r1, 119
LDI r2, 34
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
