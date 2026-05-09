; DESCRIPTION: Creates a red circular shape at (323, 138) with radius 38.
; PLAN: r0=323(x), r1=138(y), r2=38(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 323
LDI r1, 138
LDI r2, 38
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
