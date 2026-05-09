; DESCRIPTION: Places a red line segment connecting (91, 161) to (363, 41).
; PLAN: r0=91(x1), r1=161(y1), r2=363(x2), r3=41(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 91
LDI r1, 161
LDI r2, 363
LDI r3, 41
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
