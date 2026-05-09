; DESCRIPTION: Draws a yellow circle centered at (119, 25) with radius 19.
; PLAN: r0=119(x), r1=25(y), r2=19(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 119
LDI r1, 25
LDI r2, 19
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
