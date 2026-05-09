; DESCRIPTION: Draws a magenta circle centered at (167, 135) with radius 38.
; PLAN: r0=167(x), r1=135(y), r2=38(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 167
LDI r1, 135
LDI r2, 38
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
