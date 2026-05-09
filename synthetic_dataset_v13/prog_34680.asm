; DESCRIPTION: Draws a magenta circle centered at (216, 132) with radius 80.
; PLAN: r0=216(x), r1=132(y), r2=80(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 216
LDI r1, 132
LDI r2, 80
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
