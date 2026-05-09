; DESCRIPTION: Draws a purple line from (14, 216) to (175, 247).
; PLAN: r0=14(x1), r1=216(y1), r2=175(x2), r3=247(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 14
LDI r1, 216
LDI r2, 175
LDI r3, 247
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
