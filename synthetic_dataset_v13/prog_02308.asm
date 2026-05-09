; DESCRIPTION: Renders a blue disk with center (406, 148) and radius 47.
; PLAN: r0=406(x), r1=148(y), r2=47(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 406
LDI r1, 148
LDI r2, 47
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
