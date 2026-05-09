; DESCRIPTION: Renders a orange disk with center (41, 227) and radius 10.
; PLAN: r0=41(x), r1=227(y), r2=10(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 41
LDI r1, 227
LDI r2, 10
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
