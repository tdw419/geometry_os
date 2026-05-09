; DESCRIPTION: Draws a blue line from (37, 71) to (484, 179).
; PLAN: r0=37(x1), r1=71(y1), r2=484(x2), r3=179(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 37
LDI r1, 71
LDI r2, 484
LDI r3, 179
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
