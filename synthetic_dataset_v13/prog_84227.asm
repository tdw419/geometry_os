; DESCRIPTION: Draws a purple line from (411, 106) to (313, 96).
; PLAN: r0=411(x1), r1=106(y1), r2=313(x2), r3=96(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 411
LDI r1, 106
LDI r2, 313
LDI r3, 96
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
