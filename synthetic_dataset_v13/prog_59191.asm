; DESCRIPTION: Creates a purple circular shape at (395, 86) with radius 47.
; PLAN: r0=395(x), r1=86(y), r2=47(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 395
LDI r1, 86
LDI r2, 47
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
