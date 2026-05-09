; DESCRIPTION: Renders a white disk with center (115, 78) and radius 72.
; PLAN: r0=115(x), r1=78(y), r2=72(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 115
LDI r1, 78
LDI r2, 72
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
