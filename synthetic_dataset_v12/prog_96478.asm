; DESCRIPTION: Creates a purple circular shape at (112, 125) with radius 62.
; PLAN: r0=112(x), r1=125(y), r2=62(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 112
LDI r1, 125
LDI r2, 62
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
