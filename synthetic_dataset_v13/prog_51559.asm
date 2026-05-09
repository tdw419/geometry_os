; DESCRIPTION: Draws a magenta circle centered at (167, 81) with radius 44.
; PLAN: r0=167(x), r1=81(y), r2=44(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 167
LDI r1, 81
LDI r2, 44
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
