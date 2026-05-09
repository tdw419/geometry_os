; DESCRIPTION: Renders a orange disk with center (172, 22) and radius 15.
; PLAN: r0=172(x), r1=22(y), r2=15(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 172
LDI r1, 22
LDI r2, 15
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
