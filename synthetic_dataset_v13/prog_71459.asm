; DESCRIPTION: Places a blue circle of radius 62 at center (126, 67).
; PLAN: r0=126(x), r1=67(y), r2=62(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 126
LDI r1, 67
LDI r2, 62
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
