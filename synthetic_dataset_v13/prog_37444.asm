; DESCRIPTION: Draws a magenta circle centered at (452, 135) with radius 60.
; PLAN: r0=452(x), r1=135(y), r2=60(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 452
LDI r1, 135
LDI r2, 60
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
