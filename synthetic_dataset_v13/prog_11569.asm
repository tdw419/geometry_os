; DESCRIPTION: Draws a green circle centered at (89, 170) with radius 69.
; PLAN: r0=89(x), r1=170(y), r2=69(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 89
LDI r1, 170
LDI r2, 69
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
