; DESCRIPTION: Renders a orange disk with center (248, 211) and radius 14.
; PLAN: r0=248(x), r1=211(y), r2=14(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 248
LDI r1, 211
LDI r2, 14
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
