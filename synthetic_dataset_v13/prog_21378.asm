; DESCRIPTION: Creates a red circular shape at (118, 78) with radius 21.
; PLAN: r0=118(x), r1=78(y), r2=21(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 118
LDI r1, 78
LDI r2, 21
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
