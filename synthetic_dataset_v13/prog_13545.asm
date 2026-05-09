; DESCRIPTION: Draws a purple line from (369, 14) to (442, 162).
; PLAN: r0=369(x1), r1=14(y1), r2=442(x2), r3=162(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 369
LDI r1, 14
LDI r2, 442
LDI r3, 162
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
