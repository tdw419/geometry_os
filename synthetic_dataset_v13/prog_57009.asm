; DESCRIPTION: Draws a magenta circle centered at (108, 101) with radius 34.
; PLAN: r0=108(x), r1=101(y), r2=34(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 108
LDI r1, 101
LDI r2, 34
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
