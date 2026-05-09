; DESCRIPTION: Renders a black disk with center (177, 79) and radius 57.
; PLAN: r0=177(x), r1=79(y), r2=57(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 177
LDI r1, 79
LDI r2, 57
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
