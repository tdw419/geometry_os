; DESCRIPTION: Draws a blue line from (123, 101) to (135, 145).
; PLAN: r0=123(x1), r1=101(y1), r2=135(x2), r3=145(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 123
LDI r1, 101
LDI r2, 135
LDI r3, 145
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
