; DESCRIPTION: Draws a blue line from (428, 121) to (41, 181).
; PLAN: r0=428(x1), r1=121(y1), r2=41(x2), r3=181(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 428
LDI r1, 121
LDI r2, 41
LDI r3, 181
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
