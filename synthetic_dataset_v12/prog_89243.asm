; DESCRIPTION: Renders a purple disk with center (77, 58) and radius 41.
; PLAN: r0=77(x), r1=58(y), r2=41(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 77
LDI r1, 58
LDI r2, 41
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
