; DESCRIPTION: Places a blue circle of radius 26 at center (41, 68).
; PLAN: r0=41(x), r1=68(y), r2=26(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 41
LDI r1, 68
LDI r2, 26
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
