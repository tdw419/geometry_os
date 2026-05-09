; DESCRIPTION: Draws a magenta circle centered at (332, 84) with radius 13.
; PLAN: r0=332(x), r1=84(y), r2=13(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 332
LDI r1, 84
LDI r2, 13
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
