; DESCRIPTION: Places a black circle of radius 41 at center (42, 170).
; PLAN: r0=42(x), r1=170(y), r2=41(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 42
LDI r1, 170
LDI r2, 41
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
