; DESCRIPTION: Creates a purple circular shape at (323, 26) with radius 25.
; PLAN: r0=323(x), r1=26(y), r2=25(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 323
LDI r1, 26
LDI r2, 25
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
