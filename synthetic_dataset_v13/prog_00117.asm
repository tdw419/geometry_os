; DESCRIPTION: Places a yellow circle of radius 41 at center (90, 160).
; PLAN: r0=90(x), r1=160(y), r2=41(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 90
LDI r1, 160
LDI r2, 41
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
