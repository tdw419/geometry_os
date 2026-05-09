; DESCRIPTION: Renders a white disk with center (76, 167) and radius 74.
; PLAN: r0=76(x), r1=167(y), r2=74(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 76
LDI r1, 167
LDI r2, 74
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
