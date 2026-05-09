; DESCRIPTION: Places a blue circle of radius 41 at center (253, 61).
; PLAN: r0=253(x), r1=61(y), r2=41(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 253
LDI r1, 61
LDI r2, 41
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
