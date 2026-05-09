; DESCRIPTION: Creates a purple circular shape at (47, 236) with radius 20.
; PLAN: r0=47(x), r1=236(y), r2=20(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 47
LDI r1, 236
LDI r2, 20
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
