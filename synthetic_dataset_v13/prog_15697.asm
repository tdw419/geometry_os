; DESCRIPTION: Draws a purple line from (495, 68) to (190, 133).
; PLAN: r0=495(x1), r1=68(y1), r2=190(x2), r3=133(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 495
LDI r1, 68
LDI r2, 190
LDI r3, 133
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
