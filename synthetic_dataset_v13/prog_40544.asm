; DESCRIPTION: Places a black circle of radius 41 at center (457, 190).
; PLAN: r0=457(x), r1=190(y), r2=41(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 457
LDI r1, 190
LDI r2, 41
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
