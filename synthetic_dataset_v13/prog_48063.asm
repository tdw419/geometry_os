; DESCRIPTION: Renders a green disk with center (86, 62) and radius 41.
; PLAN: r0=86(x), r1=62(y), r2=41(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 86
LDI r1, 62
LDI r2, 41
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
