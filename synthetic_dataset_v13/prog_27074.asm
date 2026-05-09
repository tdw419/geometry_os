; DESCRIPTION: Renders a green disk with center (41, 80) and radius 41.
; PLAN: r0=41(x), r1=80(y), r2=41(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 41
LDI r1, 80
LDI r2, 41
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
