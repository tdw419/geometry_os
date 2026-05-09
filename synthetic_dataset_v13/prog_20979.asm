; DESCRIPTION: Creates a purple circular shape at (381, 141) with radius 47.
; PLAN: r0=381(x), r1=141(y), r2=47(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 381
LDI r1, 141
LDI r2, 47
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
