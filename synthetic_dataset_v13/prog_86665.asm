; DESCRIPTION: Draws a purple line from (377, 9) to (153, 26).
; PLAN: r0=377(x1), r1=9(y1), r2=153(x2), r3=26(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 377
LDI r1, 9
LDI r2, 153
LDI r3, 26
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
