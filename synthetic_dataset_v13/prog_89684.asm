; DESCRIPTION: Creates a blue circular shape at (371, 196) with radius 59.
; PLAN: r0=371(x), r1=196(y), r2=59(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 371
LDI r1, 196
LDI r2, 59
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
