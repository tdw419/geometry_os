; DESCRIPTION: Places a purple line segment connecting (41, 187) to (209, 80).
; PLAN: r0=41(x1), r1=187(y1), r2=209(x2), r3=80(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 41
LDI r1, 187
LDI r2, 209
LDI r3, 80
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
