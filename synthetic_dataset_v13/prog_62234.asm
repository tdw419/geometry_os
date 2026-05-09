; DESCRIPTION: Draws a yellow line from (489, 136) to (372, 66).
; PLAN: r0=489(x1), r1=136(y1), r2=372(x2), r3=66(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 489
LDI r1, 136
LDI r2, 372
LDI r3, 66
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
