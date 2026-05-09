; DESCRIPTION: Renders a purple disk with center (76, 69) and radius 13.
; PLAN: r0=76(x), r1=69(y), r2=13(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 76
LDI r1, 69
LDI r2, 13
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
