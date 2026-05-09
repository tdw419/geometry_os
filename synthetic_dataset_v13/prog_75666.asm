; DESCRIPTION: Draws a magenta circle centered at (366, 115) with radius 24.
; PLAN: r0=366(x), r1=115(y), r2=24(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 366
LDI r1, 115
LDI r2, 24
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
