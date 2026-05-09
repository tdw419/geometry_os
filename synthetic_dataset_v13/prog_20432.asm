; DESCRIPTION: Renders a orange disk with center (270, 152) and radius 76.
; PLAN: r0=270(x), r1=152(y), r2=76(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 270
LDI r1, 152
LDI r2, 76
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
