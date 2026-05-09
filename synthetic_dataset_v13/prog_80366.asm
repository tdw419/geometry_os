; DESCRIPTION: Creates a yellow circular shape at (390, 146) with radius 41.
; PLAN: r0=390(x), r1=146(y), r2=41(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 390
LDI r1, 146
LDI r2, 41
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
