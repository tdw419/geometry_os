; DESCRIPTION: Places a black circle of radius 41 at center (57, 177).
; PLAN: r0=57(x), r1=177(y), r2=41(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 57
LDI r1, 177
LDI r2, 41
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
