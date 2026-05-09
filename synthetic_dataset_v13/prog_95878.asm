; DESCRIPTION: Renders a white disk with center (186, 142) and radius 36.
; PLAN: r0=186(x), r1=142(y), r2=36(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 186
LDI r1, 142
LDI r2, 36
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
