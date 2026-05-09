; DESCRIPTION: Draws a magenta circle centered at (278, 87) with radius 74.
; PLAN: r0=278(x), r1=87(y), r2=74(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 278
LDI r1, 87
LDI r2, 74
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
