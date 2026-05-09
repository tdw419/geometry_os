; DESCRIPTION: Draws a yellow circle centered at (119, 105) with radius 24.
; PLAN: r0=119(x), r1=105(y), r2=24(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 119
LDI r1, 105
LDI r2, 24
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
