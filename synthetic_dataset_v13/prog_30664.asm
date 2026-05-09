; DESCRIPTION: Places a yellow circle of radius 41 at center (463, 136).
; PLAN: r0=463(x), r1=136(y), r2=41(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 463
LDI r1, 136
LDI r2, 41
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
