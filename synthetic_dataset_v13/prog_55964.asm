; DESCRIPTION: Renders a green disk with center (194, 169) and radius 70.
; PLAN: r0=194(x), r1=169(y), r2=70(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 194
LDI r1, 169
LDI r2, 70
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
