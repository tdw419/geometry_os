; DESCRIPTION: Draws a magenta circle centered at (192, 140) with radius 72.
; PLAN: r0=192(x), r1=140(y), r2=72(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 192
LDI r1, 140
LDI r2, 72
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
