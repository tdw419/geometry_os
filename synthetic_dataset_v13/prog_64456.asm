; DESCRIPTION: Renders a white disk with center (217, 33) and radius 26.
; PLAN: r0=217(x), r1=33(y), r2=26(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 217
LDI r1, 33
LDI r2, 26
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
