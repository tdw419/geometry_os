; DESCRIPTION: Draws a purple line from (246, 236) to (7, 67).
; PLAN: r0=246(x1), r1=236(y1), r2=7(x2), r3=67(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 246
LDI r1, 236
LDI r2, 7
LDI r3, 67
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
