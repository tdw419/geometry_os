; DESCRIPTION: Creates a red circular shape at (90, 196) with radius 41.
; PLAN: r0=90(x), r1=196(y), r2=41(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 90
LDI r1, 196
LDI r2, 41
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
