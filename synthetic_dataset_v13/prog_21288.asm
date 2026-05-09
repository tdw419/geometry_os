; DESCRIPTION: Creates a red circular shape at (137, 85) with radius 76.
; PLAN: r0=137(x), r1=85(y), r2=76(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 137
LDI r1, 85
LDI r2, 76
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
