; DESCRIPTION: Creates a purple circular shape at (233, 90) with radius 72.
; PLAN: r0=233(x), r1=90(y), r2=72(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 233
LDI r1, 90
LDI r2, 72
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
