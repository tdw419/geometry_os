; DESCRIPTION: Draws a yellow line from (508, 101) to (100, 84).
; PLAN: r0=508(x1), r1=101(y1), r2=100(x2), r3=84(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 508
LDI r1, 101
LDI r2, 100
LDI r3, 84
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
