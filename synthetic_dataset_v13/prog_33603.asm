; DESCRIPTION: Places a blue line segment connecting (41, 73) to (430, 66).
; PLAN: r0=41(x1), r1=73(y1), r2=430(x2), r3=66(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 41
LDI r1, 73
LDI r2, 430
LDI r3, 66
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
