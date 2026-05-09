; DESCRIPTION: Creates a purple circular shape at (134, 91) with radius 16.
; PLAN: r0=134(x), r1=91(y), r2=16(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 134
LDI r1, 91
LDI r2, 16
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
