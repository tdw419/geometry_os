; DESCRIPTION: Draws a purple line from (458, 109) to (44, 90).
; PLAN: r0=458(x1), r1=109(y1), r2=44(x2), r3=90(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 458
LDI r1, 109
LDI r2, 44
LDI r3, 90
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
