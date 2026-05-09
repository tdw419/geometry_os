; DESCRIPTION: Draws a purple line from (47, 170) to (263, 144).
; PLAN: r0=47(x1), r1=170(y1), r2=263(x2), r3=144(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 47
LDI r1, 170
LDI r2, 263
LDI r3, 144
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
