; DESCRIPTION: Creates a red circular shape at (93, 229) with radius 24.
; PLAN: r0=93(x), r1=229(y), r2=24(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 93
LDI r1, 229
LDI r2, 24
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
