; DESCRIPTION: Draws a magenta circle centered at (134, 196) with radius 35.
; PLAN: r0=134(x), r1=196(y), r2=35(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 134
LDI r1, 196
LDI r2, 35
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
