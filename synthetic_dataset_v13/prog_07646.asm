; DESCRIPTION: Renders a purple disk with center (99, 69) and radius 29.
; PLAN: r0=99(x), r1=69(y), r2=29(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 99
LDI r1, 69
LDI r2, 29
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
