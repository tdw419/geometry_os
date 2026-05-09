; DESCRIPTION: Draws a green circle centered at (424, 99) with radius 37.
; PLAN: r0=424(x), r1=99(y), r2=37(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 424
LDI r1, 99
LDI r2, 37
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
