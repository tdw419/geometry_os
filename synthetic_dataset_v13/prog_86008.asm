; DESCRIPTION: Renders a purple disk with center (134, 148) and radius 59.
; PLAN: r0=134(x), r1=148(y), r2=59(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 134
LDI r1, 148
LDI r2, 59
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
