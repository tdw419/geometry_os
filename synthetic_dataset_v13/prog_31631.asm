; DESCRIPTION: Draws a yellow line from (100, 119) to (431, 92).
; PLAN: r0=100(x1), r1=119(y1), r2=431(x2), r3=92(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 100
LDI r1, 119
LDI r2, 431
LDI r3, 92
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
