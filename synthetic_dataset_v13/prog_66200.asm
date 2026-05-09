; DESCRIPTION: Creates a purple circular shape at (117, 99) with radius 67.
; PLAN: r0=117(x), r1=99(y), r2=67(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 117
LDI r1, 99
LDI r2, 67
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
