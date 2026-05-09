; DESCRIPTION: Draws a purple line from (162, 59) to (206, 35).
; PLAN: r0=162(x1), r1=59(y1), r2=206(x2), r3=35(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 162
LDI r1, 59
LDI r2, 206
LDI r3, 35
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
