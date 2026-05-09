; DESCRIPTION: Draws a magenta circle centered at (259, 118) with radius 73.
; PLAN: r0=259(x), r1=118(y), r2=73(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 259
LDI r1, 118
LDI r2, 73
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
