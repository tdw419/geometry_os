; DESCRIPTION: Creates a blue circular shape at (216, 196) with radius 14.
; PLAN: r0=216(x), r1=196(y), r2=14(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 216
LDI r1, 196
LDI r2, 14
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
