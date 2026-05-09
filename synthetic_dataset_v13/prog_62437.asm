; DESCRIPTION: Draws a magenta circle centered at (158, 217) with radius 11.
; PLAN: r0=158(x), r1=217(y), r2=11(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 158
LDI r1, 217
LDI r2, 11
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
