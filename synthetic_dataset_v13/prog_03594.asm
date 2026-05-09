; DESCRIPTION: Creates a purple circular shape at (214, 28) with radius 25.
; PLAN: r0=214(x), r1=28(y), r2=25(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 214
LDI r1, 28
LDI r2, 25
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
