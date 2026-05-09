; DESCRIPTION: Draws a yellow line from (15, 99) to (382, 163).
; PLAN: r0=15(x1), r1=99(y1), r2=382(x2), r3=163(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 15
LDI r1, 99
LDI r2, 382
LDI r3, 163
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
