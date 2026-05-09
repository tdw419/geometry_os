; DESCRIPTION: Renders a white disk with center (334, 79) and radius 51.
; PLAN: r0=334(x), r1=79(y), r2=51(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 334
LDI r1, 79
LDI r2, 51
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
