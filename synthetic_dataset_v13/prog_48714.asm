; DESCRIPTION: Draws a purple line from (485, 23) to (251, 118).
; PLAN: r0=485(x1), r1=23(y1), r2=251(x2), r3=118(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 485
LDI r1, 23
LDI r2, 251
LDI r3, 118
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
