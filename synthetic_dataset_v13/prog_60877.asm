; DESCRIPTION: Draws a magenta circle centered at (457, 133) with radius 39.
; PLAN: r0=457(x), r1=133(y), r2=39(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 457
LDI r1, 133
LDI r2, 39
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
