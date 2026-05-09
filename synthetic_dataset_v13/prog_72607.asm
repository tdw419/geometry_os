; DESCRIPTION: Renders a green disk with center (261, 71) and radius 62.
; PLAN: r0=261(x), r1=71(y), r2=62(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 261
LDI r1, 71
LDI r2, 62
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
