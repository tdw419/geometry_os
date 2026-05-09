; DESCRIPTION: Draws a purple line from (134, 252) to (28, 9).
; PLAN: r0=134(x1), r1=252(y1), r2=28(x2), r3=9(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 134
LDI r1, 252
LDI r2, 28
LDI r3, 9
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
