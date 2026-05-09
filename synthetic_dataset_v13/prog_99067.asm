; DESCRIPTION: Places a purple circle of radius 41 at center (146, 82).
; PLAN: r0=146(x), r1=82(y), r2=41(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 146
LDI r1, 82
LDI r2, 41
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
