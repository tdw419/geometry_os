; DESCRIPTION: Draws a purple line from (153, 60) to (88, 85).
; PLAN: r0=153(x1), r1=60(y1), r2=88(x2), r3=85(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 153
LDI r1, 60
LDI r2, 88
LDI r3, 85
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
