; DESCRIPTION: Draws a blue line from (432, 118) to (219, 214).
; PLAN: r0=432(x1), r1=118(y1), r2=219(x2), r3=214(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 432
LDI r1, 118
LDI r2, 219
LDI r3, 214
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
