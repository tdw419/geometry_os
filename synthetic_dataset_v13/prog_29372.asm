; DESCRIPTION: Creates a purple circular shape at (198, 98) with radius 19.
; PLAN: r0=198(x), r1=98(y), r2=19(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 198
LDI r1, 98
LDI r2, 19
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
