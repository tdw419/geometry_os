; DESCRIPTION: Creates a red circular shape at (183, 153) with radius 61.
; PLAN: r0=183(x), r1=153(y), r2=61(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 183
LDI r1, 153
LDI r2, 61
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
