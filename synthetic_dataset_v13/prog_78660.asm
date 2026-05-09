; DESCRIPTION: Renders a white disk with center (98, 94) and radius 65.
; PLAN: r0=98(x), r1=94(y), r2=65(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 98
LDI r1, 94
LDI r2, 65
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
