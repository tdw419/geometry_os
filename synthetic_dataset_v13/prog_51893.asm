; DESCRIPTION: Draws a blue line from (161, 147) to (450, 233).
; PLAN: r0=161(x1), r1=147(y1), r2=450(x2), r3=233(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 161
LDI r1, 147
LDI r2, 450
LDI r3, 233
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
