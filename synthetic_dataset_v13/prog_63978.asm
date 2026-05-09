; DESCRIPTION: Creates a purple circular shape at (308, 182) with radius 71.
; PLAN: r0=308(x), r1=182(y), r2=71(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 308
LDI r1, 182
LDI r2, 71
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
