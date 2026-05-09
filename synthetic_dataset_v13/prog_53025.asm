; DESCRIPTION: Draws a purple line from (425, 169) to (226, 77).
; PLAN: r0=425(x1), r1=169(y1), r2=226(x2), r3=77(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 425
LDI r1, 169
LDI r2, 226
LDI r3, 77
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
