; DESCRIPTION: Draws a blue line from (369, 89) to (281, 72).
; PLAN: r0=369(x1), r1=89(y1), r2=281(x2), r3=72(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 369
LDI r1, 89
LDI r2, 281
LDI r3, 72
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
