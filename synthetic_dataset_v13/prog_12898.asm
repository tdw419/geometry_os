; DESCRIPTION: Renders a blue disk with center (81, 148) and radius 56.
; PLAN: r0=81(x), r1=148(y), r2=56(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 81
LDI r1, 148
LDI r2, 56
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
