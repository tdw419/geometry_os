; DESCRIPTION: Places a magenta line segment connecting (427, 252) to (41, 211).
; PLAN: r0=427(x1), r1=252(y1), r2=41(x2), r3=211(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 427
LDI r1, 252
LDI r2, 41
LDI r3, 211
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
