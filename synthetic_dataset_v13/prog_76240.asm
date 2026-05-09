; DESCRIPTION: Renders a white disk with center (186, 89) and radius 20.
; PLAN: r0=186(x), r1=89(y), r2=20(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 186
LDI r1, 89
LDI r2, 20
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
