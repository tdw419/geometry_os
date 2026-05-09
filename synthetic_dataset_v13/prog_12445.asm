; DESCRIPTION: Places a white circle of radius 41 at center (365, 80).
; PLAN: r0=365(x), r1=80(y), r2=41(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 365
LDI r1, 80
LDI r2, 41
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
