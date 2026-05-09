; DESCRIPTION: Creates a purple circular shape at (428, 214) with radius 30.
; PLAN: r0=428(x), r1=214(y), r2=30(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 428
LDI r1, 214
LDI r2, 30
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
