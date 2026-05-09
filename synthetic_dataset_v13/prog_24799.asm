; DESCRIPTION: Creates a red circular shape at (61, 73) with radius 49.
; PLAN: r0=61(x), r1=73(y), r2=49(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 61
LDI r1, 73
LDI r2, 49
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
