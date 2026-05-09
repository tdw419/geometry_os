; DESCRIPTION: Draws a magenta circle centered at (54, 181) with radius 12.
; PLAN: r0=54(x), r1=181(y), r2=12(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 54
LDI r1, 181
LDI r2, 12
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
