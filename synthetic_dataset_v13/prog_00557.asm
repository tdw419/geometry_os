; DESCRIPTION: Draws a yellow line from (312, 163) to (466, 58).
; PLAN: r0=312(x1), r1=163(y1), r2=466(x2), r3=58(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 312
LDI r1, 163
LDI r2, 466
LDI r3, 58
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
