; DESCRIPTION: Draws a yellow line from (8, 11) to (58, 185).
; PLAN: r0=8(x1), r1=11(y1), r2=58(x2), r3=185(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 8
LDI r1, 11
LDI r2, 58
LDI r3, 185
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
