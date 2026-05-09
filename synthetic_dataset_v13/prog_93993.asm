; DESCRIPTION: Creates a purple circular shape at (153, 141) with radius 49.
; PLAN: r0=153(x), r1=141(y), r2=49(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 153
LDI r1, 141
LDI r2, 49
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
