; DESCRIPTION: Renders a green disk with center (63, 158) and radius 62.
; PLAN: r0=63(x), r1=158(y), r2=62(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 63
LDI r1, 158
LDI r2, 62
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
