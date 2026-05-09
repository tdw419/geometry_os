; DESCRIPTION: Draws a blue line from (357, 104) to (163, 252).
; PLAN: r0=357(x1), r1=104(y1), r2=163(x2), r3=252(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 357
LDI r1, 104
LDI r2, 163
LDI r3, 252
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
