; DESCRIPTION: Renders a white disk with center (177, 134) and radius 79.
; PLAN: r0=177(x), r1=134(y), r2=79(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 177
LDI r1, 134
LDI r2, 79
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
