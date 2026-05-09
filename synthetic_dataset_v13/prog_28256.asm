; DESCRIPTION: Creates a purple circular shape at (134, 125) with radius 33.
; PLAN: r0=134(x), r1=125(y), r2=33(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 134
LDI r1, 125
LDI r2, 33
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
