; DESCRIPTION: Renders a orange disk with center (175, 41) and radius 24.
; PLAN: r0=175(x), r1=41(y), r2=24(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 175
LDI r1, 41
LDI r2, 24
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
