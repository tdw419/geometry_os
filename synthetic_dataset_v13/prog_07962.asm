; DESCRIPTION: Places a blue circle of radius 67 at center (355, 140).
; PLAN: r0=355(x), r1=140(y), r2=67(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 355
LDI r1, 140
LDI r2, 67
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
