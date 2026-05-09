; DESCRIPTION: Renders a orange disk with center (98, 86) and radius 41.
; PLAN: r0=98(x), r1=86(y), r2=41(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 98
LDI r1, 86
LDI r2, 41
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
