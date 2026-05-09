; DESCRIPTION: Draws a magenta circle centered at (118, 115) with radius 73.
; PLAN: r0=118(x), r1=115(y), r2=73(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 118
LDI r1, 115
LDI r2, 73
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
