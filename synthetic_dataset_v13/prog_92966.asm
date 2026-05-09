; DESCRIPTION: Draws a yellow circle centered at (290, 136) with radius 73.
; PLAN: r0=290(x), r1=136(y), r2=73(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 290
LDI r1, 136
LDI r2, 73
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
