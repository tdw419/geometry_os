; DESCRIPTION: Draws a purple line from (138, 158) to (277, 188).
; PLAN: r0=138(x1), r1=158(y1), r2=277(x2), r3=188(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 138
LDI r1, 158
LDI r2, 277
LDI r3, 188
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
