; DESCRIPTION: Draws a yellow line from (99, 81) to (391, 58).
; PLAN: r0=99(x1), r1=81(y1), r2=391(x2), r3=58(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 99
LDI r1, 81
LDI r2, 391
LDI r3, 58
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
