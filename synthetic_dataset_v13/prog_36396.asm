; DESCRIPTION: Renders a yellow disk with center (437, 187) and radius 41.
; PLAN: r0=437(x), r1=187(y), r2=41(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 437
LDI r1, 187
LDI r2, 41
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
