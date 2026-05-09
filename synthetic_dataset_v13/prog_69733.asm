; DESCRIPTION: Places a green circle of radius 62 at center (402, 145).
; PLAN: r0=402(x), r1=145(y), r2=62(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 402
LDI r1, 145
LDI r2, 62
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
