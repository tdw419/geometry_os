; DESCRIPTION: Places a purple line segment connecting (153, 71) to (58, 41).
; PLAN: r0=153(x1), r1=71(y1), r2=58(x2), r3=41(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 153
LDI r1, 71
LDI r2, 58
LDI r3, 41
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
