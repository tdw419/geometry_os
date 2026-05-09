; DESCRIPTION: Places a yellow line segment connecting (341, 157) to (125, 41).
; PLAN: r0=341(x1), r1=157(y1), r2=125(x2), r3=41(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 341
LDI r1, 157
LDI r2, 125
LDI r3, 41
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
