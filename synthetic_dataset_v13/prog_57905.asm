; DESCRIPTION: Renders a purple disk with center (137, 181) and radius 67.
; PLAN: r0=137(x), r1=181(y), r2=67(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 137
LDI r1, 181
LDI r2, 67
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
