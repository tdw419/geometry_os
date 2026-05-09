; DESCRIPTION: Draws a blue line from (222, 199) to (432, 141).
; PLAN: r0=222(x1), r1=199(y1), r2=432(x2), r3=141(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 222
LDI r1, 199
LDI r2, 432
LDI r3, 141
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
