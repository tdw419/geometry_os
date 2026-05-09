; DESCRIPTION: Renders a orange disk with center (160, 136) and radius 66.
; PLAN: r0=160(x), r1=136(y), r2=66(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 160
LDI r1, 136
LDI r2, 66
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
