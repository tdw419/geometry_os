; DESCRIPTION: Draws a purple line from (511, 8) to (363, 181).
; PLAN: r0=511(x1), r1=8(y1), r2=363(x2), r3=181(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 511
LDI r1, 8
LDI r2, 363
LDI r3, 181
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
