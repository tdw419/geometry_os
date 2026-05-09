; DESCRIPTION: Creates a red circular shape at (283, 102) with radius 75.
; PLAN: r0=283(x), r1=102(y), r2=75(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 283
LDI r1, 102
LDI r2, 75
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
