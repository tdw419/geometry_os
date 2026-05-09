; DESCRIPTION: Draws a purple line from (486, 49) to (152, 31).
; PLAN: r0=486(x1), r1=49(y1), r2=152(x2), r3=31(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 486
LDI r1, 49
LDI r2, 152
LDI r3, 31
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
