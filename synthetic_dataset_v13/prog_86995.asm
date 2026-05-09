; DESCRIPTION: Draws a purple line from (50, 247) to (501, 230).
; PLAN: r0=50(x1), r1=247(y1), r2=501(x2), r3=230(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 50
LDI r1, 247
LDI r2, 501
LDI r3, 230
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
