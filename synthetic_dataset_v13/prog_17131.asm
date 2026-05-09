; DESCRIPTION: Draws a purple line from (366, 113) to (413, 169).
; PLAN: r0=366(x1), r1=113(y1), r2=413(x2), r3=169(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 366
LDI r1, 113
LDI r2, 413
LDI r3, 169
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
