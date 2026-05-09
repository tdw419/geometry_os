; DESCRIPTION: Creates a blue circular shape at (371, 155) with radius 74.
; PLAN: r0=371(x), r1=155(y), r2=74(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 371
LDI r1, 155
LDI r2, 74
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
