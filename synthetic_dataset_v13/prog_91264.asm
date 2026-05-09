; DESCRIPTION: Renders a green disk with center (478, 158) and radius 32.
; PLAN: r0=478(x), r1=158(y), r2=32(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 478
LDI r1, 158
LDI r2, 32
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
