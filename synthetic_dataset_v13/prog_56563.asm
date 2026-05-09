; DESCRIPTION: Renders a orange disk with center (217, 200) and radius 44.
; PLAN: r0=217(x), r1=200(y), r2=44(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 217
LDI r1, 200
LDI r2, 44
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
