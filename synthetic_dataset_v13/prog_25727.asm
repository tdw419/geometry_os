; DESCRIPTION: Creates a purple circular shape at (262, 35) with radius 11.
; PLAN: r0=262(x), r1=35(y), r2=11(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 262
LDI r1, 35
LDI r2, 11
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
