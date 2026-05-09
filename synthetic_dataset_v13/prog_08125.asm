; DESCRIPTION: Places a orange line segment connecting (229, 193) to (41, 37).
; PLAN: r0=229(x1), r1=193(y1), r2=41(x2), r3=37(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 229
LDI r1, 193
LDI r2, 41
LDI r3, 37
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
