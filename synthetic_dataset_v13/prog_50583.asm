; DESCRIPTION: Creates a purple circular shape at (94, 132) with radius 12.
; PLAN: r0=94(x), r1=132(y), r2=12(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 94
LDI r1, 132
LDI r2, 12
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
