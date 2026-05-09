; DESCRIPTION: Places a white circle of radius 41 at center (241, 142).
; PLAN: r0=241(x), r1=142(y), r2=41(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 241
LDI r1, 142
LDI r2, 41
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
