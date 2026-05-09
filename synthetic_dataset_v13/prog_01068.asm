; DESCRIPTION: Creates a purple circular shape at (424, 100) with radius 65.
; PLAN: r0=424(x), r1=100(y), r2=65(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 424
LDI r1, 100
LDI r2, 65
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
