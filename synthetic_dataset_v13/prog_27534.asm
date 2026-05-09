; DESCRIPTION: Draws a blue line from (444, 121) to (3, 97).
; PLAN: r0=444(x1), r1=121(y1), r2=3(x2), r3=97(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 444
LDI r1, 121
LDI r2, 3
LDI r3, 97
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
