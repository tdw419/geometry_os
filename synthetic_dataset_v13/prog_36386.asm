; DESCRIPTION: Places a purple line segment connecting (136, 191) to (208, 41).
; PLAN: r0=136(x1), r1=191(y1), r2=208(x2), r3=41(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 136
LDI r1, 191
LDI r2, 208
LDI r3, 41
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
