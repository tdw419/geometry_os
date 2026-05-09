; DESCRIPTION: Renders a orange disk with center (334, 103) and radius 18.
; PLAN: r0=334(x), r1=103(y), r2=18(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 334
LDI r1, 103
LDI r2, 18
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
