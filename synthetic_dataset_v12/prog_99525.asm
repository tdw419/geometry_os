; DESCRIPTION: Renders a green disk with center (233, 158) and radius 58.
; PLAN: r0=233(x), r1=158(y), r2=58(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 233
LDI r1, 158
LDI r2, 58
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
