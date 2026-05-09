; DESCRIPTION: Draws a purple line from (395, 247) to (313, 201).
; PLAN: r0=395(x1), r1=247(y1), r2=313(x2), r3=201(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 395
LDI r1, 247
LDI r2, 313
LDI r3, 201
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
