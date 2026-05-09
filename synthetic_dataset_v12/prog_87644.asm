; DESCRIPTION: Draws a blue line from (38, 160) to (273, 181).
; PLAN: r0=38(x1), r1=160(y1), r2=273(x2), r3=181(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 38
LDI r1, 160
LDI r2, 273
LDI r3, 181
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
