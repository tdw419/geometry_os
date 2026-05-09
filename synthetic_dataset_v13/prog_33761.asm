; DESCRIPTION: Draws a purple line from (18, 251) to (325, 41).
; PLAN: r0=18(x1), r1=251(y1), r2=325(x2), r3=41(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 18
LDI r1, 251
LDI r2, 325
LDI r3, 41
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
