; DESCRIPTION: Draws a purple line from (62, 19) to (11, 41).
; PLAN: r0=62(x1), r1=19(y1), r2=11(x2), r3=41(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 62
LDI r1, 19
LDI r2, 11
LDI r3, 41
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
