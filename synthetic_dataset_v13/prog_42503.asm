; DESCRIPTION: Creates a red circular shape at (279, 69) with radius 41.
; PLAN: r0=279(x), r1=69(y), r2=41(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 279
LDI r1, 69
LDI r2, 41
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
