; DESCRIPTION: Draws a magenta circle centered at (427, 179) with radius 13.
; PLAN: r0=427(x), r1=179(y), r2=13(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 427
LDI r1, 179
LDI r2, 13
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
