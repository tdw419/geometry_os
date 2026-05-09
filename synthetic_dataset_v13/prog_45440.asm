; DESCRIPTION: Creates a red circular shape at (477, 167) with radius 11.
; PLAN: r0=477(x), r1=167(y), r2=11(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 477
LDI r1, 167
LDI r2, 11
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
