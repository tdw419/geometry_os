; DESCRIPTION: Creates a red circular shape at (205, 34) with radius 30.
; PLAN: r0=205(x), r1=34(y), r2=30(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 205
LDI r1, 34
LDI r2, 30
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
