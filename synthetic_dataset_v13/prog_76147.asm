; DESCRIPTION: Draws a blue line from (248, 178) to (377, 108).
; PLAN: r0=248(x1), r1=178(y1), r2=377(x2), r3=108(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 248
LDI r1, 178
LDI r2, 377
LDI r3, 108
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
