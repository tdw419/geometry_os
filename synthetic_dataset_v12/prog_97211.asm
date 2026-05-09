; DESCRIPTION: Draws a purple line from (216, 24) to (334, 138).
; PLAN: r0=216(x1), r1=24(y1), r2=334(x2), r3=138(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 216
LDI r1, 24
LDI r2, 334
LDI r3, 138
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
