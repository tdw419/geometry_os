; DESCRIPTION: Draws a yellow line from (444, 7) to (212, 232).
; PLAN: r0=444(x1), r1=7(y1), r2=212(x2), r3=232(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 444
LDI r1, 7
LDI r2, 212
LDI r3, 232
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
