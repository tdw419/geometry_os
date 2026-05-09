; DESCRIPTION: Renders a yellow disk with center (359, 41) and radius 30.
; PLAN: r0=359(x), r1=41(y), r2=30(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 359
LDI r1, 41
LDI r2, 30
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
