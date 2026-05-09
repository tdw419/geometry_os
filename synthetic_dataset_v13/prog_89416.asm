; DESCRIPTION: Draws a purple line from (483, 120) to (216, 148).
; PLAN: r0=483(x1), r1=120(y1), r2=216(x2), r3=148(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 483
LDI r1, 120
LDI r2, 216
LDI r3, 148
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
