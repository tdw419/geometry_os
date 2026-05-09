; DESCRIPTION: Places a green line segment connecting (130, 14) to (207, 41).
; PLAN: r0=130(x1), r1=14(y1), r2=207(x2), r3=41(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 130
LDI r1, 14
LDI r2, 207
LDI r3, 41
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
