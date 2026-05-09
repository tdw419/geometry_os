; DESCRIPTION: Places a yellow circle of radius 41 at center (160, 158).
; PLAN: r0=160(x), r1=158(y), r2=41(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 160
LDI r1, 158
LDI r2, 41
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
