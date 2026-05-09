; DESCRIPTION: Renders a blue disk with center (23, 41) and radius 14.
; PLAN: r0=23(x), r1=41(y), r2=14(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 23
LDI r1, 41
LDI r2, 14
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
