; DESCRIPTION: Places a black line segment connecting (118, 24) to (68, 41).
; PLAN: r0=118(x1), r1=24(y1), r2=68(x2), r3=41(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 118
LDI r1, 24
LDI r2, 68
LDI r3, 41
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
