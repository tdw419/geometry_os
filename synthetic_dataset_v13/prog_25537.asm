; DESCRIPTION: Draws a yellow line from (236, 147) to (272, 217).
; PLAN: r0=236(x1), r1=147(y1), r2=272(x2), r3=217(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 236
LDI r1, 147
LDI r2, 272
LDI r3, 217
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
