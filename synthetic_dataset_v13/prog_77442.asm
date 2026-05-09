; DESCRIPTION: Renders a green disk with center (58, 176) and radius 36.
; PLAN: r0=58(x), r1=176(y), r2=36(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 58
LDI r1, 176
LDI r2, 36
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
