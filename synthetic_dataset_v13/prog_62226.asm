; DESCRIPTION: Creates a blue circular shape at (67, 157) with radius 46.
; PLAN: r0=67(x), r1=157(y), r2=46(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 67
LDI r1, 157
LDI r2, 46
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
