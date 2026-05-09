; DESCRIPTION: Draws a magenta circle centered at (292, 83) with radius 37.
; PLAN: r0=292(x), r1=83(y), r2=37(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 292
LDI r1, 83
LDI r2, 37
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
