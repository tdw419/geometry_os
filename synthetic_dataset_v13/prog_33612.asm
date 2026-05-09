; DESCRIPTION: Creates a red circular shape at (193, 163) with radius 41.
; PLAN: r0=193(x), r1=163(y), r2=41(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 193
LDI r1, 163
LDI r2, 41
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
