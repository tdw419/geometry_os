; DESCRIPTION: Creates a red circular shape at (115, 119) with radius 53.
; PLAN: r0=115(x), r1=119(y), r2=53(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 115
LDI r1, 119
LDI r2, 53
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
