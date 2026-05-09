; DESCRIPTION: Draws a purple line from (221, 140) to (473, 212).
; PLAN: r0=221(x1), r1=140(y1), r2=473(x2), r3=212(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 221
LDI r1, 140
LDI r2, 473
LDI r3, 212
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
