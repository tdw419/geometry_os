; DESCRIPTION: Creates a purple circular shape at (214, 57) with radius 13.
; PLAN: r0=214(x), r1=57(y), r2=13(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 214
LDI r1, 57
LDI r2, 13
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
