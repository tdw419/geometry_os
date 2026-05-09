; DESCRIPTION: Renders a white disk with center (262, 177) and radius 71.
; PLAN: r0=262(x), r1=177(y), r2=71(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 262
LDI r1, 177
LDI r2, 71
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
