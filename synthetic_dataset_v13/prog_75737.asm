; DESCRIPTION: Renders a green disk with center (427, 123) and radius 56.
; PLAN: r0=427(x), r1=123(y), r2=56(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 427
LDI r1, 123
LDI r2, 56
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
