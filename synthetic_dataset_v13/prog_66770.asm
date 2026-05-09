; DESCRIPTION: Creates a purple circular shape at (439, 84) with radius 19.
; PLAN: r0=439(x), r1=84(y), r2=19(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 439
LDI r1, 84
LDI r2, 19
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
