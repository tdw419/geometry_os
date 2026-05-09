; DESCRIPTION: Creates a purple circular shape at (110, 114) with radius 79.
; PLAN: r0=110(x), r1=114(y), r2=79(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 110
LDI r1, 114
LDI r2, 79
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
