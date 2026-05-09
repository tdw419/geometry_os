; DESCRIPTION: Creates a red circular shape at (287, 92) with radius 35.
; PLAN: r0=287(x), r1=92(y), r2=35(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 287
LDI r1, 92
LDI r2, 35
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
