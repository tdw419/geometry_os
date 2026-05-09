; DESCRIPTION: Renders a green disk with center (416, 83) and radius 26.
; PLAN: r0=416(x), r1=83(y), r2=26(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 416
LDI r1, 83
LDI r2, 26
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
