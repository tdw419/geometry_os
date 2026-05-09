; DESCRIPTION: Creates a purple circular shape at (187, 119) with radius 22.
; PLAN: r0=187(x), r1=119(y), r2=22(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 187
LDI r1, 119
LDI r2, 22
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
