; DESCRIPTION: Draws a purple line from (404, 148) to (73, 101).
; PLAN: r0=404(x1), r1=148(y1), r2=73(x2), r3=101(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 404
LDI r1, 148
LDI r2, 73
LDI r3, 101
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
