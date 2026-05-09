; DESCRIPTION: Draws a yellow circle centered at (139, 78) with radius 34.
; PLAN: r0=139(x), r1=78(y), r2=34(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 139
LDI r1, 78
LDI r2, 34
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
