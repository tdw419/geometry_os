; DESCRIPTION: Renders a blue disk with center (230, 70) and radius 41.
; PLAN: r0=230(x), r1=70(y), r2=41(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 230
LDI r1, 70
LDI r2, 41
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
