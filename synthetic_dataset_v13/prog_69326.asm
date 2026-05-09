; DESCRIPTION: Draws a magenta circle centered at (463, 62) with radius 36.
; PLAN: r0=463(x), r1=62(y), r2=36(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 463
LDI r1, 62
LDI r2, 36
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
