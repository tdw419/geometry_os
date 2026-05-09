; DESCRIPTION: Renders a orange disk with center (425, 188) and radius 41.
; PLAN: r0=425(x), r1=188(y), r2=41(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 425
LDI r1, 188
LDI r2, 41
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
