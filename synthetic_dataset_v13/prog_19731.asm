; DESCRIPTION: Draws a purple line from (41, 136) to (364, 214).
; PLAN: r0=41(x1), r1=136(y1), r2=364(x2), r3=214(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 41
LDI r1, 136
LDI r2, 364
LDI r3, 214
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
