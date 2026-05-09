; DESCRIPTION: Renders a white disk with center (177, 179) and radius 71.
; PLAN: r0=177(x), r1=179(y), r2=71(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 177
LDI r1, 179
LDI r2, 71
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
