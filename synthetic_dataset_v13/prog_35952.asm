; DESCRIPTION: Draws a purple line from (110, 250) to (473, 90).
; PLAN: r0=110(x1), r1=250(y1), r2=473(x2), r3=90(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 110
LDI r1, 250
LDI r2, 473
LDI r3, 90
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
