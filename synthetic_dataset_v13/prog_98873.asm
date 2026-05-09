; DESCRIPTION: Creates a red circular shape at (238, 145) with radius 22.
; PLAN: r0=238(x), r1=145(y), r2=22(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 238
LDI r1, 145
LDI r2, 22
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
