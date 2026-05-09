; DESCRIPTION: Renders a orange disk with center (417, 217) and radius 34.
; PLAN: r0=417(x), r1=217(y), r2=34(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 417
LDI r1, 217
LDI r2, 34
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
