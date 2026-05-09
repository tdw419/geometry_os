; DESCRIPTION: Renders a purple disk with center (416, 69) and radius 24.
; PLAN: r0=416(x), r1=69(y), r2=24(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 416
LDI r1, 69
LDI r2, 24
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
