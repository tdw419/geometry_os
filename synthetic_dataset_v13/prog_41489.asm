; DESCRIPTION: Renders a white disk with center (335, 98) and radius 30.
; PLAN: r0=335(x), r1=98(y), r2=30(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 335
LDI r1, 98
LDI r2, 30
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
