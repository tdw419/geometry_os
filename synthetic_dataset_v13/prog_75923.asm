; DESCRIPTION: Renders a green disk with center (339, 176) and radius 36.
; PLAN: r0=339(x), r1=176(y), r2=36(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 339
LDI r1, 176
LDI r2, 36
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
