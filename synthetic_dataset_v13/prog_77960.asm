; DESCRIPTION: Renders a purple disk with center (41, 105) and radius 35.
; PLAN: r0=41(x), r1=105(y), r2=35(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 41
LDI r1, 105
LDI r2, 35
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
