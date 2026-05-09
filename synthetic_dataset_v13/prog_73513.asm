; DESCRIPTION: Creates a purple circular shape at (399, 153) with radius 18.
; PLAN: r0=399(x), r1=153(y), r2=18(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 399
LDI r1, 153
LDI r2, 18
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
