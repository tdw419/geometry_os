; DESCRIPTION: Draws a blue line from (314, 149) to (306, 208).
; PLAN: r0=314(x1), r1=149(y1), r2=306(x2), r3=208(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 314
LDI r1, 149
LDI r2, 306
LDI r3, 208
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
