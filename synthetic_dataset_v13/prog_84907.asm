; DESCRIPTION: Places a blue circle of radius 34 at center (67, 101).
; PLAN: r0=67(x), r1=101(y), r2=34(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 67
LDI r1, 101
LDI r2, 34
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
