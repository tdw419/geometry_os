; DESCRIPTION: Renders a green disk with center (339, 183) and radius 54.
; PLAN: r0=339(x), r1=183(y), r2=54(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 339
LDI r1, 183
LDI r2, 54
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
