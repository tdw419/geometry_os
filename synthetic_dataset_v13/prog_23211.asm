; DESCRIPTION: Draws a magenta circle centered at (339, 75) with radius 68.
; PLAN: r0=339(x), r1=75(y), r2=68(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 339
LDI r1, 75
LDI r2, 68
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
