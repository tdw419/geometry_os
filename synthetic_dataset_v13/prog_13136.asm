; DESCRIPTION: Draws a yellow line from (358, 166) to (278, 97).
; PLAN: r0=358(x1), r1=166(y1), r2=278(x2), r3=97(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 358
LDI r1, 166
LDI r2, 278
LDI r3, 97
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
