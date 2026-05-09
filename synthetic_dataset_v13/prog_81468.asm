; DESCRIPTION: Draws a purple line from (473, 143) to (132, 101).
; PLAN: r0=473(x1), r1=143(y1), r2=132(x2), r3=101(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 473
LDI r1, 143
LDI r2, 132
LDI r3, 101
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
