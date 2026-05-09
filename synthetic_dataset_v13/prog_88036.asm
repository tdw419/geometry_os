; DESCRIPTION: Renders a white disk with center (451, 148) and radius 54.
; PLAN: r0=451(x), r1=148(y), r2=54(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 451
LDI r1, 148
LDI r2, 54
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
