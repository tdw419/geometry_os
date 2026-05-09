; DESCRIPTION: Draws a purple line from (451, 153) to (505, 26).
; PLAN: r0=451(x1), r1=153(y1), r2=505(x2), r3=26(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 451
LDI r1, 153
LDI r2, 505
LDI r3, 26
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
