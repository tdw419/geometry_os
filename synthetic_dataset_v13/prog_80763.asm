; DESCRIPTION: Renders a orange disk with center (254, 102) and radius 71.
; PLAN: r0=254(x), r1=102(y), r2=71(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 254
LDI r1, 102
LDI r2, 71
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
