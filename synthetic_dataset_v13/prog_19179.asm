; DESCRIPTION: Draws a purple line from (9, 127) to (162, 237).
; PLAN: r0=9(x1), r1=127(y1), r2=162(x2), r3=237(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 9
LDI r1, 127
LDI r2, 162
LDI r3, 237
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
