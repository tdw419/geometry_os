; DESCRIPTION: Draws a purple line from (335, 178) to (142, 34).
; PLAN: r0=335(x1), r1=178(y1), r2=142(x2), r3=34(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 335
LDI r1, 178
LDI r2, 142
LDI r3, 34
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
