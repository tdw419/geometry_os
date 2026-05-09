; DESCRIPTION: Draws a purple line from (158, 7) to (76, 69).
; PLAN: r0=158(x1), r1=7(y1), r2=76(x2), r3=69(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 158
LDI r1, 7
LDI r2, 76
LDI r3, 69
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
