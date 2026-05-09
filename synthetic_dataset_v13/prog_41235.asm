; DESCRIPTION: Creates a purple circular shape at (266, 86) with radius 35.
; PLAN: r0=266(x), r1=86(y), r2=35(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 266
LDI r1, 86
LDI r2, 35
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
