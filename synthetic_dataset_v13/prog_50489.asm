; DESCRIPTION: Renders a white disk with center (321, 146) and radius 79.
; PLAN: r0=321(x), r1=146(y), r2=79(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 321
LDI r1, 146
LDI r2, 79
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
