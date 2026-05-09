; DESCRIPTION: Draws a purple line from (404, 89) to (222, 19).
; PLAN: r0=404(x1), r1=89(y1), r2=222(x2), r3=19(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 404
LDI r1, 89
LDI r2, 222
LDI r3, 19
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
