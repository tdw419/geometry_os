; DESCRIPTION: Draws a yellow circle centered at (325, 139) with radius 66.
; PLAN: r0=325(x), r1=139(y), r2=66(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 325
LDI r1, 139
LDI r2, 66
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
