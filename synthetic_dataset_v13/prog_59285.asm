; DESCRIPTION: Creates a red circular shape at (377, 110) with radius 62.
; PLAN: r0=377(x), r1=110(y), r2=62(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 377
LDI r1, 110
LDI r2, 62
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
