; DESCRIPTION: Creates a purple circular shape at (187, 118) with radius 54.
; PLAN: r0=187(x), r1=118(y), r2=54(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 187
LDI r1, 118
LDI r2, 54
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
