; DESCRIPTION: Renders a blue disk with center (449, 163) and radius 41.
; PLAN: r0=449(x), r1=163(y), r2=41(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 449
LDI r1, 163
LDI r2, 41
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
