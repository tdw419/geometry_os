; DESCRIPTION: Creates a red circular shape at (376, 53) with radius 39.
; PLAN: r0=376(x), r1=53(y), r2=39(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 376
LDI r1, 53
LDI r2, 39
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
