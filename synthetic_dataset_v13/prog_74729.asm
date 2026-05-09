; DESCRIPTION: Renders a orange disk with center (252, 167) and radius 37.
; PLAN: r0=252(x), r1=167(y), r2=37(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 252
LDI r1, 167
LDI r2, 37
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
