; DESCRIPTION: Draws a magenta circle centered at (89, 192) with radius 58.
; PLAN: r0=89(x), r1=192(y), r2=58(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 89
LDI r1, 192
LDI r2, 58
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
