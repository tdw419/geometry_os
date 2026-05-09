; DESCRIPTION: Draws a purple line from (162, 59) to (85, 161).
; PLAN: r0=162(x1), r1=59(y1), r2=85(x2), r3=161(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 162
LDI r1, 59
LDI r2, 85
LDI r3, 161
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
