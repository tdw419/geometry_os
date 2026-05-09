; DESCRIPTION: Draws a purple line from (363, 178) to (399, 9).
; PLAN: r0=363(x1), r1=178(y1), r2=399(x2), r3=9(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 363
LDI r1, 178
LDI r2, 399
LDI r3, 9
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
