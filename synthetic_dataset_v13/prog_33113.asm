; DESCRIPTION: Draws a magenta circle centered at (169, 36) with radius 21.
; PLAN: r0=169(x), r1=36(y), r2=21(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 169
LDI r1, 36
LDI r2, 21
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
