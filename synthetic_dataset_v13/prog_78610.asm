; DESCRIPTION: Draws a yellow circle centered at (225, 88) with radius 75.
; PLAN: r0=225(x), r1=88(y), r2=75(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 225
LDI r1, 88
LDI r2, 75
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
