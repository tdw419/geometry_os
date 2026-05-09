; DESCRIPTION: Draws a purple line from (365, 217) to (297, 67).
; PLAN: r0=365(x1), r1=217(y1), r2=297(x2), r3=67(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 365
LDI r1, 217
LDI r2, 297
LDI r3, 67
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
