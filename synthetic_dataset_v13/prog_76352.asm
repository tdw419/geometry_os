; DESCRIPTION: Draws a blue line from (455, 217) to (218, 163).
; PLAN: r0=455(x1), r1=217(y1), r2=218(x2), r3=163(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 455
LDI r1, 217
LDI r2, 218
LDI r3, 163
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
