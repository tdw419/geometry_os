; DESCRIPTION: Places a blue circle of radius 67 at center (304, 93).
; PLAN: r0=304(x), r1=93(y), r2=67(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 304
LDI r1, 93
LDI r2, 67
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
