; DESCRIPTION: Draws a blue line from (22, 158) to (175, 244).
; PLAN: r0=22(x1), r1=158(y1), r2=175(x2), r3=244(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 22
LDI r1, 158
LDI r2, 175
LDI r3, 244
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
