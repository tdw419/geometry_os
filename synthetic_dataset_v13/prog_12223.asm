; DESCRIPTION: Draws a magenta circle centered at (122, 171) with radius 22.
; PLAN: r0=122(x), r1=171(y), r2=22(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 122
LDI r1, 171
LDI r2, 22
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
