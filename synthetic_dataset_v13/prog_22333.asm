; DESCRIPTION: Draws a purple line from (174, 67) to (22, 35).
; PLAN: r0=174(x1), r1=67(y1), r2=22(x2), r3=35(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 174
LDI r1, 67
LDI r2, 22
LDI r3, 35
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
