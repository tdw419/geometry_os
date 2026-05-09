; DESCRIPTION: Renders a blue disk with center (435, 58) and radius 33.
; PLAN: r0=435(x), r1=58(y), r2=33(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 435
LDI r1, 58
LDI r2, 33
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
