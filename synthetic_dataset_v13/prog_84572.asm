; DESCRIPTION: Renders a purple disk with center (198, 67) and radius 55.
; PLAN: r0=198(x), r1=67(y), r2=55(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 198
LDI r1, 67
LDI r2, 55
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
