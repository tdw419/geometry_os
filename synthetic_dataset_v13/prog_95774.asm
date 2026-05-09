; DESCRIPTION: Draws a magenta circle centered at (166, 60) with radius 44.
; PLAN: r0=166(x), r1=60(y), r2=44(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 166
LDI r1, 60
LDI r2, 44
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
