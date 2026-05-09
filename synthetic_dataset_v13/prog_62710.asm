; DESCRIPTION: Creates a purple circular shape at (115, 210) with radius 46.
; PLAN: r0=115(x), r1=210(y), r2=46(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 115
LDI r1, 210
LDI r2, 46
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
