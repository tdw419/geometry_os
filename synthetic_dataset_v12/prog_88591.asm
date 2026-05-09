; DESCRIPTION: Draws a blue line from (314, 109) to (118, 176).
; PLAN: r0=314(x1), r1=109(y1), r2=118(x2), r3=176(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 314
LDI r1, 109
LDI r2, 118
LDI r3, 176
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
