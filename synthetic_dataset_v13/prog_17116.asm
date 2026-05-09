; DESCRIPTION: Renders a orange disk with center (23, 81) and radius 23.
; PLAN: r0=23(x), r1=81(y), r2=23(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 23
LDI r1, 81
LDI r2, 23
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
