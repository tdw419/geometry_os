; DESCRIPTION: Draws a magenta circle centered at (370, 29) with radius 15.
; PLAN: r0=370(x), r1=29(y), r2=15(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 370
LDI r1, 29
LDI r2, 15
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
