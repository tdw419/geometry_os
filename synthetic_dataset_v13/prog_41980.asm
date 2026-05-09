; DESCRIPTION: Draws a purple line from (231, 52) to (389, 26).
; PLAN: r0=231(x1), r1=52(y1), r2=389(x2), r3=26(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 231
LDI r1, 52
LDI r2, 389
LDI r3, 26
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
