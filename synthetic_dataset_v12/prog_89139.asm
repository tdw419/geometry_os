; DESCRIPTION: Creates a purple circular shape at (177, 94) with radius 70.
; PLAN: r0=177(x), r1=94(y), r2=70(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 177
LDI r1, 94
LDI r2, 70
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
