; DESCRIPTION: Renders a blue disk with center (110, 171) and radius 41.
; PLAN: r0=110(x), r1=171(y), r2=41(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 110
LDI r1, 171
LDI r2, 41
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
