; DESCRIPTION: Creates a purple circular shape at (381, 134) with radius 57.
; PLAN: r0=381(x), r1=134(y), r2=57(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 381
LDI r1, 134
LDI r2, 57
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
