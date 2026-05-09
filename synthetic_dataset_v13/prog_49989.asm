; DESCRIPTION: Places a purple circle of radius 41 at center (353, 162).
; PLAN: r0=353(x), r1=162(y), r2=41(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 353
LDI r1, 162
LDI r2, 41
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
