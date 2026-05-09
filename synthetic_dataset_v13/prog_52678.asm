; DESCRIPTION: Renders a orange disk with center (124, 72) and radius 35.
; PLAN: r0=124(x), r1=72(y), r2=35(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 124
LDI r1, 72
LDI r2, 35
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
