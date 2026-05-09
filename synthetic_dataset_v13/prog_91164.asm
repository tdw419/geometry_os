; DESCRIPTION: Renders a green disk with center (396, 101) and radius 11.
; PLAN: r0=396(x), r1=101(y), r2=11(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 396
LDI r1, 101
LDI r2, 11
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
