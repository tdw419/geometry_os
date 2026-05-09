; DESCRIPTION: Creates a purple circular shape at (68, 115) with radius 43.
; PLAN: r0=68(x), r1=115(y), r2=43(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 68
LDI r1, 115
LDI r2, 43
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
