; DESCRIPTION: Renders a black disk with center (217, 34) and radius 12.
; PLAN: r0=217(x), r1=34(y), r2=12(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 217
LDI r1, 34
LDI r2, 12
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
