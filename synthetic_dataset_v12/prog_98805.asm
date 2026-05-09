; DESCRIPTION: Renders a white disk with center (407, 177) and radius 61.
; PLAN: r0=407(x), r1=177(y), r2=61(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 407
LDI r1, 177
LDI r2, 61
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
