; DESCRIPTION: Creates a yellow circular shape at (376, 53) with radius 43.
; PLAN: r0=376(x), r1=53(y), r2=43(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 376
LDI r1, 53
LDI r2, 43
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
