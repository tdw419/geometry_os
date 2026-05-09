; DESCRIPTION: Renders a green disk with center (201, 84) and radius 77.
; PLAN: r0=201(x), r1=84(y), r2=77(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 201
LDI r1, 84
LDI r2, 77
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
