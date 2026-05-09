; DESCRIPTION: Places a red circle of radius 41 at center (73, 81).
; PLAN: r0=73(x), r1=81(y), r2=41(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 73
LDI r1, 81
LDI r2, 41
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
