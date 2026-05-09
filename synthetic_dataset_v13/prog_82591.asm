; DESCRIPTION: Creates a blue circular shape at (381, 67) with radius 26.
; PLAN: r0=381(x), r1=67(y), r2=26(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 381
LDI r1, 67
LDI r2, 26
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
