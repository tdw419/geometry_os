; DESCRIPTION: Draws a magenta circle centered at (384, 155) with radius 62.
; PLAN: r0=384(x), r1=155(y), r2=62(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 384
LDI r1, 155
LDI r2, 62
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
