; DESCRIPTION: Draws a purple line from (9, 119) to (329, 78).
; PLAN: r0=9(x1), r1=119(y1), r2=329(x2), r3=78(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 9
LDI r1, 119
LDI r2, 329
LDI r3, 78
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
