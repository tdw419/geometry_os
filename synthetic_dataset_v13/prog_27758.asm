; DESCRIPTION: Creates a purple circular shape at (194, 133) with radius 16.
; PLAN: r0=194(x), r1=133(y), r2=16(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 194
LDI r1, 133
LDI r2, 16
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
