; DESCRIPTION: Renders a white disk with center (448, 69) and radius 41.
; PLAN: r0=448(x), r1=69(y), r2=41(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 448
LDI r1, 69
LDI r2, 41
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
