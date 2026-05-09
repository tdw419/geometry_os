; DESCRIPTION: Renders a blue disk with center (353, 211) and radius 41.
; PLAN: r0=353(x), r1=211(y), r2=41(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 353
LDI r1, 211
LDI r2, 41
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
