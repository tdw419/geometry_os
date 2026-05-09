; DESCRIPTION: Renders a orange disk with center (248, 77) and radius 69.
; PLAN: r0=248(x), r1=77(y), r2=69(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 248
LDI r1, 77
LDI r2, 69
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
