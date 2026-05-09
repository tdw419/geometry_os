; DESCRIPTION: Creates a purple circular shape at (300, 191) with radius 44.
; PLAN: r0=300(x), r1=191(y), r2=44(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 300
LDI r1, 191
LDI r2, 44
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
