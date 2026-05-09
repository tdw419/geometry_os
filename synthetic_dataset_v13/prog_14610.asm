; DESCRIPTION: Renders a white disk with center (390, 58) and radius 54.
; PLAN: r0=390(x), r1=58(y), r2=54(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 390
LDI r1, 58
LDI r2, 54
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
