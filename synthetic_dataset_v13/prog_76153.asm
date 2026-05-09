; DESCRIPTION: Renders a orange disk with center (234, 115) and radius 72.
; PLAN: r0=234(x), r1=115(y), r2=72(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 234
LDI r1, 115
LDI r2, 72
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
