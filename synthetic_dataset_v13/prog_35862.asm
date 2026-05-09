; DESCRIPTION: Draws a purple line from (368, 25) to (501, 41).
; PLAN: r0=368(x1), r1=25(y1), r2=501(x2), r3=41(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 368
LDI r1, 25
LDI r2, 501
LDI r3, 41
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
