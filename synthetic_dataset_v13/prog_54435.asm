; DESCRIPTION: Renders a green disk with center (76, 83) and radius 26.
; PLAN: r0=76(x), r1=83(y), r2=26(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 76
LDI r1, 83
LDI r2, 26
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
