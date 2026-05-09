; DESCRIPTION: Creates a red circular shape at (131, 114) with radius 78.
; PLAN: r0=131(x), r1=114(y), r2=78(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 131
LDI r1, 114
LDI r2, 78
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
