; DESCRIPTION: Draws a purple line from (58, 5) to (369, 103).
; PLAN: r0=58(x1), r1=5(y1), r2=369(x2), r3=103(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 58
LDI r1, 5
LDI r2, 369
LDI r3, 103
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
