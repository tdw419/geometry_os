; DESCRIPTION: Places a blue circle of radius 67 at center (403, 148).
; PLAN: r0=403(x), r1=148(y), r2=67(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 403
LDI r1, 148
LDI r2, 67
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
