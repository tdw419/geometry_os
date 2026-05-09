; DESCRIPTION: Renders a green disk with center (421, 144) and radius 62.
; PLAN: r0=421(x), r1=144(y), r2=62(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 421
LDI r1, 144
LDI r2, 62
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
