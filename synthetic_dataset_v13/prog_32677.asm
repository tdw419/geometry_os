; DESCRIPTION: Draws a green circle centered at (83, 89) with radius 62.
; PLAN: r0=83(x), r1=89(y), r2=62(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 83
LDI r1, 89
LDI r2, 62
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
