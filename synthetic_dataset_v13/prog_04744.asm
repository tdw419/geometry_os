; DESCRIPTION: Places a yellow line segment connecting (41, 252) to (374, 167).
; PLAN: r0=41(x1), r1=252(y1), r2=374(x2), r3=167(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 41
LDI r1, 252
LDI r2, 374
LDI r3, 167
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
