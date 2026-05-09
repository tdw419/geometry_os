; DESCRIPTION: Creates a red circular shape at (376, 101) with radius 70.
; PLAN: r0=376(x), r1=101(y), r2=70(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 376
LDI r1, 101
LDI r2, 70
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
