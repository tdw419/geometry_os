; DESCRIPTION: Draws a blue line from (72, 89) to (504, 155).
; PLAN: r0=72(x1), r1=89(y1), r2=504(x2), r3=155(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 72
LDI r1, 89
LDI r2, 504
LDI r3, 155
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
