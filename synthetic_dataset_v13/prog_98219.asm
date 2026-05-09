; DESCRIPTION: Creates a blue circular shape at (473, 192) with radius 35.
; PLAN: r0=473(x), r1=192(y), r2=35(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 473
LDI r1, 192
LDI r2, 35
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
