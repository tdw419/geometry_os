; DESCRIPTION: Creates a purple circular shape at (378, 148) with radius 46.
; PLAN: r0=378(x), r1=148(y), r2=46(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 378
LDI r1, 148
LDI r2, 46
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
