; DESCRIPTION: Places a yellow circle of radius 16 at center (41, 28).
; PLAN: r0=41(x), r1=28(y), r2=16(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 41
LDI r1, 28
LDI r2, 16
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
