; DESCRIPTION: Renders a orange disk with center (432, 109) and radius 80.
; PLAN: r0=432(x), r1=109(y), r2=80(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 432
LDI r1, 109
LDI r2, 80
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
