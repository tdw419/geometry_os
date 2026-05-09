; DESCRIPTION: Draws a magenta circle centered at (158, 98) with radius 35.
; PLAN: r0=158(x), r1=98(y), r2=35(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 158
LDI r1, 98
LDI r2, 35
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
