; DESCRIPTION: Draws a green circle centered at (89, 139) with radius 30.
; PLAN: r0=89(x), r1=139(y), r2=30(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 89
LDI r1, 139
LDI r2, 30
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
