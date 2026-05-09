; DESCRIPTION: Draws a purple line from (366, 76) to (486, 46).
; PLAN: r0=366(x1), r1=76(y1), r2=486(x2), r3=46(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 366
LDI r1, 76
LDI r2, 486
LDI r3, 46
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
