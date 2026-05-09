; DESCRIPTION: Creates a purple circular shape at (285, 41) with radius 36.
; PLAN: r0=285(x), r1=41(y), r2=36(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 285
LDI r1, 41
LDI r2, 36
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
