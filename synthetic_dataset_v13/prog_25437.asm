; DESCRIPTION: Draws a blue line from (423, 161) to (408, 193).
; PLAN: r0=423(x1), r1=161(y1), r2=408(x2), r3=193(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 423
LDI r1, 161
LDI r2, 408
LDI r3, 193
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
