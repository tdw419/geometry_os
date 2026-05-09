; DESCRIPTION: Draws a purple line from (138, 109) to (98, 35).
; PLAN: r0=138(x1), r1=109(y1), r2=98(x2), r3=35(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 138
LDI r1, 109
LDI r2, 98
LDI r3, 35
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
