; DESCRIPTION: Creates a purple circular shape at (13, 178) with radius 12.
; PLAN: r0=13(x), r1=178(y), r2=12(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 13
LDI r1, 178
LDI r2, 12
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
