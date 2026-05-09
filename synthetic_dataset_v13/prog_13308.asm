; DESCRIPTION: Draws a purple line from (144, 28) to (420, 118).
; PLAN: r0=144(x1), r1=28(y1), r2=420(x2), r3=118(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 144
LDI r1, 28
LDI r2, 420
LDI r3, 118
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
