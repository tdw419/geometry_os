; DESCRIPTION: Renders a blue disk with center (67, 81) and radius 53.
; PLAN: r0=67(x), r1=81(y), r2=53(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 67
LDI r1, 81
LDI r2, 53
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
