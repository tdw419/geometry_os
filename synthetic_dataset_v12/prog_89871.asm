; DESCRIPTION: Draws a blue line from (315, 229) to (101, 156).
; PLAN: r0=315(x1), r1=229(y1), r2=101(x2), r3=156(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 315
LDI r1, 229
LDI r2, 101
LDI r3, 156
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
