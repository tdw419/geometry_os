; DESCRIPTION: Draws a magenta circle centered at (318, 179) with radius 20.
; PLAN: r0=318(x), r1=179(y), r2=20(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 318
LDI r1, 179
LDI r2, 20
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
