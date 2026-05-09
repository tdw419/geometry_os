; DESCRIPTION: Draws a magenta circle centered at (53, 90) with radius 26.
; PLAN: r0=53(x), r1=90(y), r2=26(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 53
LDI r1, 90
LDI r2, 26
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
