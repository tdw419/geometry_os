; DESCRIPTION: Places a purple line segment connecting (41, 102) to (353, 210).
; PLAN: r0=41(x1), r1=102(y1), r2=353(x2), r3=210(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 41
LDI r1, 102
LDI r2, 353
LDI r3, 210
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
