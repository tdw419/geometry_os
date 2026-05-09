; DESCRIPTION: Draws a purple line from (39, 170) to (1, 124).
; PLAN: r0=39(x1), r1=170(y1), r2=1(x2), r3=124(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 39
LDI r1, 170
LDI r2, 1
LDI r3, 124
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
