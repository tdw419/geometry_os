; DESCRIPTION: Creates a purple circular shape at (443, 158) with radius 23.
; PLAN: r0=443(x), r1=158(y), r2=23(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 443
LDI r1, 158
LDI r2, 23
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
