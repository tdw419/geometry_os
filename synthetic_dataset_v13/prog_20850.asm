; DESCRIPTION: Draws a purple circle centered at (107, 187) with radius 41.
; PLAN: r0=107(x), r1=187(y), r2=41(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 107
LDI r1, 187
LDI r2, 41
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
