; DESCRIPTION: Draws a yellow circle centered at (421, 153) with radius 74.
; PLAN: r0=421(x), r1=153(y), r2=74(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 421
LDI r1, 153
LDI r2, 74
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
