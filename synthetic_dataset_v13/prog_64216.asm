; DESCRIPTION: Places a purple circle of radius 20 at center (41, 38).
; PLAN: r0=41(x), r1=38(y), r2=20(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 41
LDI r1, 38
LDI r2, 20
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
