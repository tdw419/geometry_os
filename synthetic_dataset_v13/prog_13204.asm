; DESCRIPTION: Creates a red circular shape at (252, 76) with radius 30.
; PLAN: r0=252(x), r1=76(y), r2=30(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 252
LDI r1, 76
LDI r2, 30
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
