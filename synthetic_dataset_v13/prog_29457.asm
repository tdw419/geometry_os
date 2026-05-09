; DESCRIPTION: Places a purple circle of radius 41 at center (296, 53).
; PLAN: r0=296(x), r1=53(y), r2=41(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 296
LDI r1, 53
LDI r2, 41
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
