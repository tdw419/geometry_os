; DESCRIPTION: Renders a blue disk with center (223, 148) and radius 61.
; PLAN: r0=223(x), r1=148(y), r2=61(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 223
LDI r1, 148
LDI r2, 61
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
