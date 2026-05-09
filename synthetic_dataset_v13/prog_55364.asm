; DESCRIPTION: Renders a blue disk with center (248, 94) and radius 55.
; PLAN: r0=248(x), r1=94(y), r2=55(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 248
LDI r1, 94
LDI r2, 55
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
