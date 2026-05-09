; DESCRIPTION: Draws a purple line from (437, 181) to (140, 23).
; PLAN: r0=437(x1), r1=181(y1), r2=140(x2), r3=23(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 437
LDI r1, 181
LDI r2, 140
LDI r3, 23
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
