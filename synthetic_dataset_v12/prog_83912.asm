; DESCRIPTION: Renders a blue disk with center (409, 57) and radius 18.
; PLAN: r0=409(x), r1=57(y), r2=18(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 409
LDI r1, 57
LDI r2, 18
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
