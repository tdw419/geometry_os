; DESCRIPTION: Draws a green circle centered at (435, 78) with radius 22.
; PLAN: r0=435(x), r1=78(y), r2=22(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 435
LDI r1, 78
LDI r2, 22
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
