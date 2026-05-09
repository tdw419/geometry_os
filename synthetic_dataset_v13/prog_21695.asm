; DESCRIPTION: Creates a blue circular shape at (201, 59) with radius 38.
; PLAN: r0=201(x), r1=59(y), r2=38(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 201
LDI r1, 59
LDI r2, 38
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
