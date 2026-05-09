; DESCRIPTION: Creates a purple circular shape at (360, 159) with radius 14.
; PLAN: r0=360(x), r1=159(y), r2=14(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 360
LDI r1, 159
LDI r2, 14
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
