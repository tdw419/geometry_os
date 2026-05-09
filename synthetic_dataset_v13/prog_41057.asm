; DESCRIPTION: Draws a yellow line from (26, 34) to (336, 163).
; PLAN: r0=26(x1), r1=34(y1), r2=336(x2), r3=163(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 26
LDI r1, 34
LDI r2, 336
LDI r3, 163
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
