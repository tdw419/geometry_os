; DESCRIPTION: Draws a magenta circle centered at (110, 40) with radius 22.
; PLAN: r0=110(x), r1=40(y), r2=22(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 110
LDI r1, 40
LDI r2, 22
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
