; DESCRIPTION: Draws a purple line from (120, 57) to (430, 31).
; PLAN: r0=120(x1), r1=57(y1), r2=430(x2), r3=31(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 120
LDI r1, 57
LDI r2, 430
LDI r3, 31
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
