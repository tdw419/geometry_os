; DESCRIPTION: Renders a white disk with center (314, 81) and radius 69.
; PLAN: r0=314(x), r1=81(y), r2=69(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 314
LDI r1, 81
LDI r2, 69
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
