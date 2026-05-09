; DESCRIPTION: Renders a white disk with center (126, 155) and radius 77.
; PLAN: r0=126(x), r1=155(y), r2=77(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 126
LDI r1, 155
LDI r2, 77
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
