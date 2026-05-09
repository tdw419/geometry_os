; DESCRIPTION: Creates a purple circular shape at (60, 21) with radius 10.
; PLAN: r0=60(x), r1=21(y), r2=10(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 60
LDI r1, 21
LDI r2, 10
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
