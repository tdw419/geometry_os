; DESCRIPTION: Places a blue circle of radius 41 at center (157, 161).
; PLAN: r0=157(x), r1=161(y), r2=41(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 157
LDI r1, 161
LDI r2, 41
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
