; DESCRIPTION: Draws a purple line from (251, 36) to (353, 38).
; PLAN: r0=251(x1), r1=36(y1), r2=353(x2), r3=38(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 251
LDI r1, 36
LDI r2, 353
LDI r3, 38
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
