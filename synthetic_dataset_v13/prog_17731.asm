; DESCRIPTION: Draws a magenta circle centered at (325, 184) with radius 22.
; PLAN: r0=325(x), r1=184(y), r2=22(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 325
LDI r1, 184
LDI r2, 22
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
