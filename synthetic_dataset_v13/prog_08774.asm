; DESCRIPTION: Creates a red circular shape at (96, 92) with radius 68.
; PLAN: r0=96(x), r1=92(y), r2=68(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 96
LDI r1, 92
LDI r2, 68
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
