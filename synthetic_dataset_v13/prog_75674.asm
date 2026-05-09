; DESCRIPTION: Draws a magenta circle centered at (99, 153) with radius 25.
; PLAN: r0=99(x), r1=153(y), r2=25(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 99
LDI r1, 153
LDI r2, 25
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
