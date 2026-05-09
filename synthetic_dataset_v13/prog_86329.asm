; DESCRIPTION: Draws a magenta circle centered at (339, 134) with radius 40.
; PLAN: r0=339(x), r1=134(y), r2=40(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 339
LDI r1, 134
LDI r2, 40
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
