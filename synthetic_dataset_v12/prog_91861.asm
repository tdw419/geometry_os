; DESCRIPTION: Renders a white disk with center (471, 109) and radius 24.
; PLAN: r0=471(x), r1=109(y), r2=24(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 471
LDI r1, 109
LDI r2, 24
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
