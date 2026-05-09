; DESCRIPTION: Creates a purple circular shape at (458, 86) with radius 43.
; PLAN: r0=458(x), r1=86(y), r2=43(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 458
LDI r1, 86
LDI r2, 43
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
