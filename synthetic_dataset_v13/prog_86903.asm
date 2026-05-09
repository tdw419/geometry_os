; DESCRIPTION: Renders a purple disk with center (67, 138) and radius 47.
; PLAN: r0=67(x), r1=138(y), r2=47(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 67
LDI r1, 138
LDI r2, 47
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
