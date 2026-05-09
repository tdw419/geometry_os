; DESCRIPTION: Draws a purple line from (422, 118) to (313, 170).
; PLAN: r0=422(x1), r1=118(y1), r2=313(x2), r3=170(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 422
LDI r1, 118
LDI r2, 313
LDI r3, 170
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
