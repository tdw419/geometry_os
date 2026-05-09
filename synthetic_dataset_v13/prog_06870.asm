; DESCRIPTION: Draws a red line from (430, 198) to (216, 145).
; PLAN: r0=430(x1), r1=198(y1), r2=216(x2), r3=145(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 430
LDI r1, 198
LDI r2, 216
LDI r3, 145
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
