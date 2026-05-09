; DESCRIPTION: Draws a purple line from (216, 120) to (75, 77).
; PLAN: r0=216(x1), r1=120(y1), r2=75(x2), r3=77(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 216
LDI r1, 120
LDI r2, 75
LDI r3, 77
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
