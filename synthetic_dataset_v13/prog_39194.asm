; DESCRIPTION: Draws a purple line from (369, 67) to (18, 94).
; PLAN: r0=369(x1), r1=67(y1), r2=18(x2), r3=94(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 369
LDI r1, 67
LDI r2, 18
LDI r3, 94
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
