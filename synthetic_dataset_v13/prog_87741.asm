; DESCRIPTION: Draws a purple line from (458, 22) to (363, 85).
; PLAN: r0=458(x1), r1=22(y1), r2=363(x2), r3=85(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 458
LDI r1, 22
LDI r2, 363
LDI r3, 85
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
