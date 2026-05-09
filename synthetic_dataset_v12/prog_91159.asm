; DESCRIPTION: Draws a yellow line from (14, 61) to (186, 163).
; PLAN: r0=14(x1), r1=61(y1), r2=186(x2), r3=163(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 14
LDI r1, 61
LDI r2, 186
LDI r3, 163
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
