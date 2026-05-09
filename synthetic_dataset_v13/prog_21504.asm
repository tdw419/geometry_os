; DESCRIPTION: Creates a red circular shape at (41, 152) with radius 32.
; PLAN: r0=41(x), r1=152(y), r2=32(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 41
LDI r1, 152
LDI r2, 32
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
