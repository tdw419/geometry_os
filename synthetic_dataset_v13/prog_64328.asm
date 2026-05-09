; DESCRIPTION: Creates a purple circular shape at (378, 117) with radius 20.
; PLAN: r0=378(x), r1=117(y), r2=20(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 378
LDI r1, 117
LDI r2, 20
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
