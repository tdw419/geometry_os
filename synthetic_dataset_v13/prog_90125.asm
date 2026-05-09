; DESCRIPTION: Renders a blue disk with center (177, 54) and radius 41.
; PLAN: r0=177(x), r1=54(y), r2=41(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 177
LDI r1, 54
LDI r2, 41
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
