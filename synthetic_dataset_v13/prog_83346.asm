; DESCRIPTION: Draws a blue line from (169, 158) to (261, 16).
; PLAN: r0=169(x1), r1=158(y1), r2=261(x2), r3=16(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 169
LDI r1, 158
LDI r2, 261
LDI r3, 16
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
