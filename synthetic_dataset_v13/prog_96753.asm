; DESCRIPTION: Creates a blue circular shape at (212, 214) with radius 41.
; PLAN: r0=212(x), r1=214(y), r2=41(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 212
LDI r1, 214
LDI r2, 41
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
