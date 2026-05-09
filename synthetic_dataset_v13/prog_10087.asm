; DESCRIPTION: Renders a orange disk with center (234, 217) and radius 11.
; PLAN: r0=234(x), r1=217(y), r2=11(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 234
LDI r1, 217
LDI r2, 11
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
