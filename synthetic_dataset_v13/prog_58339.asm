; DESCRIPTION: Creates a purple circular shape at (383, 144) with radius 46.
; PLAN: r0=383(x), r1=144(y), r2=46(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 383
LDI r1, 144
LDI r2, 46
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
