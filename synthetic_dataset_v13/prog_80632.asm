; DESCRIPTION: Renders a orange disk with center (88, 23) and radius 20.
; PLAN: r0=88(x), r1=23(y), r2=20(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 88
LDI r1, 23
LDI r2, 20
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
