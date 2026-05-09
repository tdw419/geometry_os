; DESCRIPTION: Creates a purple circular shape at (177, 169) with radius 61.
; PLAN: r0=177(x), r1=169(y), r2=61(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 177
LDI r1, 169
LDI r2, 61
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
