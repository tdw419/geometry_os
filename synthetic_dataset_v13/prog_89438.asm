; DESCRIPTION: Draws a green line from (447, 169) to (163, 142).
; PLAN: r0=447(x1), r1=169(y1), r2=163(x2), r3=142(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 447
LDI r1, 169
LDI r2, 163
LDI r3, 142
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
