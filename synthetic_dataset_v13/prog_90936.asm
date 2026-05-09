; DESCRIPTION: Renders a orange disk with center (83, 88) and radius 39.
; PLAN: r0=83(x), r1=88(y), r2=39(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 83
LDI r1, 88
LDI r2, 39
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
