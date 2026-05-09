; DESCRIPTION: Draws a magenta circle centered at (349, 79) with radius 66.
; PLAN: r0=349(x), r1=79(y), r2=66(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 349
LDI r1, 79
LDI r2, 66
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
