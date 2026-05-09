; DESCRIPTION: Renders a green disk with center (435, 158) and radius 16.
; PLAN: r0=435(x), r1=158(y), r2=16(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 435
LDI r1, 158
LDI r2, 16
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
