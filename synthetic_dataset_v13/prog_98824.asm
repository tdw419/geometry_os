; DESCRIPTION: Draws a purple line from (41, 191) to (3, 22).
; PLAN: r0=41(x1), r1=191(y1), r2=3(x2), r3=22(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 41
LDI r1, 191
LDI r2, 3
LDI r3, 22
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
