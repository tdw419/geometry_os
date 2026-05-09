; DESCRIPTION: Draws a purple line from (123, 106) to (412, 99).
; PLAN: r0=123(x1), r1=106(y1), r2=412(x2), r3=99(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 123
LDI r1, 106
LDI r2, 412
LDI r3, 99
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
