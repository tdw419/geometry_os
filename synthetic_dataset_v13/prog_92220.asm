; DESCRIPTION: Renders a orange disk with center (338, 123) and radius 71.
; PLAN: r0=338(x), r1=123(y), r2=71(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 338
LDI r1, 123
LDI r2, 71
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
