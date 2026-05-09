; DESCRIPTION: Creates a purple circular shape at (157, 83) with radius 55.
; PLAN: r0=157(x), r1=83(y), r2=55(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 157
LDI r1, 83
LDI r2, 55
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
