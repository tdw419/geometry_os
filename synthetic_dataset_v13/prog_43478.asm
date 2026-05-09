; DESCRIPTION: Draws a green circle centered at (55, 170) with radius 46.
; PLAN: r0=55(x), r1=170(y), r2=46(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 55
LDI r1, 170
LDI r2, 46
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
