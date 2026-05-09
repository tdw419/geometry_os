; DESCRIPTION: Draws a purple line from (466, 7) to (350, 233).
; PLAN: r0=466(x1), r1=7(y1), r2=350(x2), r3=233(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 466
LDI r1, 7
LDI r2, 350
LDI r3, 233
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
