; DESCRIPTION: Draws a purple line from (196, 118) to (478, 40).
; PLAN: r0=196(x1), r1=118(y1), r2=478(x2), r3=40(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 196
LDI r1, 118
LDI r2, 478
LDI r3, 40
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
