; DESCRIPTION: Renders a orange disk with center (430, 178) and radius 35.
; PLAN: r0=430(x), r1=178(y), r2=35(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 430
LDI r1, 178
LDI r2, 35
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
