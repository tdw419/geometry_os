; DESCRIPTION: Draws a blue line from (357, 218) to (447, 13).
; PLAN: r0=357(x1), r1=218(y1), r2=447(x2), r3=13(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 357
LDI r1, 218
LDI r2, 447
LDI r3, 13
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
