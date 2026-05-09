; DESCRIPTION: Draws a magenta circle centered at (342, 115) with radius 60.
; PLAN: r0=342(x), r1=115(y), r2=60(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 342
LDI r1, 115
LDI r2, 60
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
