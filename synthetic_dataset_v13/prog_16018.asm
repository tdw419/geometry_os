; DESCRIPTION: Draws a red line from (451, 136) to (61, 221).
; PLAN: r0=451(x1), r1=136(y1), r2=61(x2), r3=221(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 451
LDI r1, 136
LDI r2, 61
LDI r3, 221
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
