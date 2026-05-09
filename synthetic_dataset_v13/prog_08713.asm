; DESCRIPTION: Creates a purple circular shape at (338, 214) with radius 21.
; PLAN: r0=338(x), r1=214(y), r2=21(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 338
LDI r1, 214
LDI r2, 21
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
