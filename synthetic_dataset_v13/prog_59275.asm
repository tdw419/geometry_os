; DESCRIPTION: Creates a purple circular shape at (339, 139) with radius 18.
; PLAN: r0=339(x), r1=139(y), r2=18(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 339
LDI r1, 139
LDI r2, 18
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
