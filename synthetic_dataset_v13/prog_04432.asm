; DESCRIPTION: Creates a purple circular shape at (109, 214) with radius 17.
; PLAN: r0=109(x), r1=214(y), r2=17(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 109
LDI r1, 214
LDI r2, 17
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
