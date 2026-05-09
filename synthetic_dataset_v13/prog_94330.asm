; DESCRIPTION: Draws a magenta circle centered at (140, 181) with radius 47.
; PLAN: r0=140(x), r1=181(y), r2=47(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 140
LDI r1, 181
LDI r2, 47
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
