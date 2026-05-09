; DESCRIPTION: Renders a white disk with center (277, 156) and radius 41.
; PLAN: r0=277(x), r1=156(y), r2=41(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 277
LDI r1, 156
LDI r2, 41
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
