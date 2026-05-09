; DESCRIPTION: Draws a yellow line from (212, 250) to (100, 116).
; PLAN: r0=212(x1), r1=250(y1), r2=100(x2), r3=116(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 212
LDI r1, 250
LDI r2, 100
LDI r3, 116
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
