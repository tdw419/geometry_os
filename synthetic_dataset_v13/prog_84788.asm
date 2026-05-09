; DESCRIPTION: Renders a black disk with center (217, 174) and radius 25.
; PLAN: r0=217(x), r1=174(y), r2=25(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 217
LDI r1, 174
LDI r2, 25
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
