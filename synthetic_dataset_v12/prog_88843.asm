; DESCRIPTION: Places a blue circle of radius 41 at center (259, 101).
; PLAN: r0=259(x), r1=101(y), r2=41(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 259
LDI r1, 101
LDI r2, 41
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
