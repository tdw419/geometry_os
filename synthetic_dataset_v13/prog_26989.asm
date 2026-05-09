; DESCRIPTION: Draws a purple line from (369, 84) to (460, 205).
; PLAN: r0=369(x1), r1=84(y1), r2=460(x2), r3=205(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 369
LDI r1, 84
LDI r2, 460
LDI r3, 205
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
