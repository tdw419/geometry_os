; DESCRIPTION: Creates a purple circular shape at (18, 207) with radius 17.
; PLAN: r0=18(x), r1=207(y), r2=17(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 18
LDI r1, 207
LDI r2, 17
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
