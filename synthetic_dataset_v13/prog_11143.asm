; DESCRIPTION: Renders a white disk with center (70, 169) and radius 47.
; PLAN: r0=70(x), r1=169(y), r2=47(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 70
LDI r1, 169
LDI r2, 47
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
