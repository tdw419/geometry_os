; DESCRIPTION: Draws a purple line from (363, 19) to (145, 170).
; PLAN: r0=363(x1), r1=19(y1), r2=145(x2), r3=170(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 363
LDI r1, 19
LDI r2, 145
LDI r3, 170
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
