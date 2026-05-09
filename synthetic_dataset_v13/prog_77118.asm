; DESCRIPTION: Creates a purple circular shape at (246, 169) with radius 52.
; PLAN: r0=246(x), r1=169(y), r2=52(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 246
LDI r1, 169
LDI r2, 52
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
