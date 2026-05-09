; DESCRIPTION: Draws a green circle centered at (431, 123) with radius 40.
; PLAN: r0=431(x), r1=123(y), r2=40(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 431
LDI r1, 123
LDI r2, 40
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
