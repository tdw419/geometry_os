; DESCRIPTION: Draws a blue line from (505, 95) to (350, 41).
; PLAN: r0=505(x1), r1=95(y1), r2=350(x2), r3=41(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 505
LDI r1, 95
LDI r2, 350
LDI r3, 41
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
