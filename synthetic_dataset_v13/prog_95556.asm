; DESCRIPTION: Draws a yellow line from (58, 121) to (489, 140).
; PLAN: r0=58(x1), r1=121(y1), r2=489(x2), r3=140(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 58
LDI r1, 121
LDI r2, 489
LDI r3, 140
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
