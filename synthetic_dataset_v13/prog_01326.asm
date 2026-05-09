; DESCRIPTION: Creates a purple circular shape at (264, 162) with radius 38.
; PLAN: r0=264(x), r1=162(y), r2=38(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 264
LDI r1, 162
LDI r2, 38
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
