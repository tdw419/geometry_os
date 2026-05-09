; DESCRIPTION: Draws a purple line from (75, 30) to (67, 77).
; PLAN: r0=75(x1), r1=30(y1), r2=67(x2), r3=77(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 75
LDI r1, 30
LDI r2, 67
LDI r3, 77
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
