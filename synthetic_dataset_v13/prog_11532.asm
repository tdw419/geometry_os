; DESCRIPTION: Draws a purple line from (366, 52) to (211, 84).
; PLAN: r0=366(x1), r1=52(y1), r2=211(x2), r3=84(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 366
LDI r1, 52
LDI r2, 211
LDI r3, 84
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
