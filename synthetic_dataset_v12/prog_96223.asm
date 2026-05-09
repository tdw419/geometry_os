; DESCRIPTION: Draws a blue line from (457, 162) to (65, 23).
; PLAN: r0=457(x1), r1=162(y1), r2=65(x2), r3=23(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 457
LDI r1, 162
LDI r2, 65
LDI r3, 23
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
