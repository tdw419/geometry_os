; DESCRIPTION: Draws a purple line from (288, 170) to (101, 101).
; PLAN: r0=288(x1), r1=170(y1), r2=101(x2), r3=101(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 288
LDI r1, 170
LDI r2, 101
LDI r3, 101
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
