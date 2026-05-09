; DESCRIPTION: Creates a purple circular shape at (447, 138) with radius 50.
; PLAN: r0=447(x), r1=138(y), r2=50(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 447
LDI r1, 138
LDI r2, 50
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
