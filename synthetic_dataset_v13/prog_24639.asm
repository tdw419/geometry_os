; DESCRIPTION: Places a white circle of radius 41 at center (212, 146).
; PLAN: r0=212(x), r1=146(y), r2=41(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 212
LDI r1, 146
LDI r2, 41
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
