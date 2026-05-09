; DESCRIPTION: Draws a magenta circle centered at (125, 89) with radius 79.
; PLAN: r0=125(x), r1=89(y), r2=79(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 125
LDI r1, 89
LDI r2, 79
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
