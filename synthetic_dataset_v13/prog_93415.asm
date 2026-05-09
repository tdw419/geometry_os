; DESCRIPTION: Draws a magenta circle centered at (135, 169) with radius 53.
; PLAN: r0=135(x), r1=169(y), r2=53(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 135
LDI r1, 169
LDI r2, 53
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
