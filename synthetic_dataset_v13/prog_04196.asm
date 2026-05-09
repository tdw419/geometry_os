; DESCRIPTION: Places a red line segment connecting (374, 58) to (232, 41).
; PLAN: r0=374(x1), r1=58(y1), r2=232(x2), r3=41(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 374
LDI r1, 58
LDI r2, 232
LDI r3, 41
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
