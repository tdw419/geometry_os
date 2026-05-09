; DESCRIPTION: Renders a blue disk with center (422, 78) and radius 67.
; PLAN: r0=422(x), r1=78(y), r2=67(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 422
LDI r1, 78
LDI r2, 67
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
