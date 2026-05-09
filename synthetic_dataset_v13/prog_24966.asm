; DESCRIPTION: Draws a magenta circle centered at (423, 23) with radius 22.
; PLAN: r0=423(x), r1=23(y), r2=22(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 423
LDI r1, 23
LDI r2, 22
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
