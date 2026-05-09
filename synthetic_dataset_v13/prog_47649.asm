; DESCRIPTION: Draws a green circle centered at (34, 78) with radius 29.
; PLAN: r0=34(x), r1=78(y), r2=29(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 34
LDI r1, 78
LDI r2, 29
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
