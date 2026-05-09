; DESCRIPTION: Places a blue circle of radius 66 at center (214, 67).
; PLAN: r0=214(x), r1=67(y), r2=66(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 214
LDI r1, 67
LDI r2, 66
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
