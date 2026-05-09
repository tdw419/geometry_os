; DESCRIPTION: Renders a white disk with center (313, 89) and radius 77.
; PLAN: r0=313(x), r1=89(y), r2=77(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 313
LDI r1, 89
LDI r2, 77
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
