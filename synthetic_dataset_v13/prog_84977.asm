; DESCRIPTION: Draws a purple line from (450, 212) to (428, 78).
; PLAN: r0=450(x1), r1=212(y1), r2=428(x2), r3=78(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 450
LDI r1, 212
LDI r2, 428
LDI r3, 78
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
