; DESCRIPTION: Renders a orange disk with center (439, 138) and radius 69.
; PLAN: r0=439(x), r1=138(y), r2=69(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 439
LDI r1, 138
LDI r2, 69
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
