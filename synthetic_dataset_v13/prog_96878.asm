; DESCRIPTION: Draws a purple line from (142, 138) to (222, 188).
; PLAN: r0=142(x1), r1=138(y1), r2=222(x2), r3=188(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 142
LDI r1, 138
LDI r2, 222
LDI r3, 188
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
