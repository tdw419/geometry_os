; DESCRIPTION: Creates a purple circular shape at (117, 158) with radius 75.
; PLAN: r0=117(x), r1=158(y), r2=75(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 117
LDI r1, 158
LDI r2, 75
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
