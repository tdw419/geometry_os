; DESCRIPTION: Creates a red circular shape at (196, 162) with radius 41.
; PLAN: r0=196(x), r1=162(y), r2=41(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 196
LDI r1, 162
LDI r2, 41
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
