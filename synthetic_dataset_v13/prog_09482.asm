; DESCRIPTION: Creates a purple circular shape at (366, 118) with radius 78.
; PLAN: r0=366(x), r1=118(y), r2=78(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 366
LDI r1, 118
LDI r2, 78
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
