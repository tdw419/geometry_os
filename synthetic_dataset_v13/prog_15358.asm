; DESCRIPTION: Draws a magenta circle centered at (350, 81) with radius 78.
; PLAN: r0=350(x), r1=81(y), r2=78(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 350
LDI r1, 81
LDI r2, 78
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
