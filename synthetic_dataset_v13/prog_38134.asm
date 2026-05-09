; DESCRIPTION: Draws a purple line from (335, 143) to (140, 66).
; PLAN: r0=335(x1), r1=143(y1), r2=140(x2), r3=66(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 335
LDI r1, 143
LDI r2, 140
LDI r3, 66
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
