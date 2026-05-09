; DESCRIPTION: Creates a red circular shape at (469, 52) with radius 13.
; PLAN: r0=469(x), r1=52(y), r2=13(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 469
LDI r1, 52
LDI r2, 13
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
