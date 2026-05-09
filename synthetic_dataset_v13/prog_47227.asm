; DESCRIPTION: Creates a red circular shape at (238, 194) with radius 58.
; PLAN: r0=238(x), r1=194(y), r2=58(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 238
LDI r1, 194
LDI r2, 58
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
