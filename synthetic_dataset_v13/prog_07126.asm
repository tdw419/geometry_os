; DESCRIPTION: Creates a purple circular shape at (368, 177) with radius 76.
; PLAN: r0=368(x), r1=177(y), r2=76(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 368
LDI r1, 177
LDI r2, 76
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
