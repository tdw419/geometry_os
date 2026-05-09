; DESCRIPTION: Creates a yellow circular shape at (400, 138) with radius 41.
; PLAN: r0=400(x), r1=138(y), r2=41(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 400
LDI r1, 138
LDI r2, 41
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
