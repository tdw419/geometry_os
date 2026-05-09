; DESCRIPTION: Draws a magenta circle centered at (351, 83) with radius 43.
; PLAN: r0=351(x), r1=83(y), r2=43(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 351
LDI r1, 83
LDI r2, 43
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
