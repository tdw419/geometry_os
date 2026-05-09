; DESCRIPTION: Renders a blue disk with center (281, 110) and radius 41.
; PLAN: r0=281(x), r1=110(y), r2=41(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 281
LDI r1, 110
LDI r2, 41
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
