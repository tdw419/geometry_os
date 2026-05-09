; DESCRIPTION: Places a purple line segment connecting (115, 35) to (229, 41).
; PLAN: r0=115(x1), r1=35(y1), r2=229(x2), r3=41(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 115
LDI r1, 35
LDI r2, 229
LDI r3, 41
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
