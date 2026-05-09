; DESCRIPTION: Draws a magenta circle centered at (390, 125) with radius 80.
; PLAN: r0=390(x), r1=125(y), r2=80(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 390
LDI r1, 125
LDI r2, 80
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
