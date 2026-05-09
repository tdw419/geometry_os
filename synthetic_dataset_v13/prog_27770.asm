; DESCRIPTION: Draws a magenta circle centered at (427, 98) with radius 63.
; PLAN: r0=427(x), r1=98(y), r2=63(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 427
LDI r1, 98
LDI r2, 63
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
