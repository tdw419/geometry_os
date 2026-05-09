; DESCRIPTION: Draws a blue line from (31, 216) to (483, 13).
; PLAN: r0=31(x1), r1=216(y1), r2=483(x2), r3=13(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 31
LDI r1, 216
LDI r2, 483
LDI r3, 13
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
