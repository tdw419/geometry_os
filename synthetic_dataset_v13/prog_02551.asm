; DESCRIPTION: Creates a blue circular shape at (416, 134) with radius 41.
; PLAN: r0=416(x), r1=134(y), r2=41(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 416
LDI r1, 134
LDI r2, 41
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
