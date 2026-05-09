; DESCRIPTION: Draws a blue line from (357, 56) to (188, 7).
; PLAN: r0=357(x1), r1=56(y1), r2=188(x2), r3=7(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 357
LDI r1, 56
LDI r2, 188
LDI r3, 7
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
