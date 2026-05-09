; DESCRIPTION: Renders a white disk with center (145, 183) and radius 71.
; PLAN: r0=145(x), r1=183(y), r2=71(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 145
LDI r1, 183
LDI r2, 71
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
