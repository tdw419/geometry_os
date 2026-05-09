; DESCRIPTION: Draws a green circle centered at (302, 123) with radius 80.
; PLAN: r0=302(x), r1=123(y), r2=80(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 302
LDI r1, 123
LDI r2, 80
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
