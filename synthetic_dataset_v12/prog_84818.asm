; DESCRIPTION: Renders a green disk with center (351, 110) and radius 58.
; PLAN: r0=351(x), r1=110(y), r2=58(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 351
LDI r1, 110
LDI r2, 58
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
