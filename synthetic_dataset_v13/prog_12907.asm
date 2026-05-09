; DESCRIPTION: Creates a purple circular shape at (99, 103) with radius 31.
; PLAN: r0=99(x), r1=103(y), r2=31(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 99
LDI r1, 103
LDI r2, 31
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
