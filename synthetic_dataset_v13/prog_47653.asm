; DESCRIPTION: Renders a white disk with center (71, 180) and radius 70.
; PLAN: r0=71(x), r1=180(y), r2=70(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 71
LDI r1, 180
LDI r2, 70
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
