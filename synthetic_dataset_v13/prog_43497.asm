; DESCRIPTION: Renders a orange disk with center (18, 100) and radius 14.
; PLAN: r0=18(x), r1=100(y), r2=14(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 18
LDI r1, 100
LDI r2, 14
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
