; DESCRIPTION: Renders a white disk with center (94, 65) and radius 44.
; PLAN: r0=94(x), r1=65(y), r2=44(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 94
LDI r1, 65
LDI r2, 44
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
