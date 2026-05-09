; DESCRIPTION: Creates a black circular shape at (323, 93) with radius 73.
; PLAN: r0=323(x), r1=93(y), r2=73(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 323
LDI r1, 93
LDI r2, 73
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
