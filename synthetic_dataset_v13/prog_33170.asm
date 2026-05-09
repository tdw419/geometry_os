; DESCRIPTION: Renders a blue disk with center (206, 142) and radius 17.
; PLAN: r0=206(x), r1=142(y), r2=17(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 206
LDI r1, 142
LDI r2, 17
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
