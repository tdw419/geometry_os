; DESCRIPTION: Places a white circle of radius 32 at center (74, 41).
; PLAN: r0=74(x), r1=41(y), r2=32(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 74
LDI r1, 41
LDI r2, 32
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
