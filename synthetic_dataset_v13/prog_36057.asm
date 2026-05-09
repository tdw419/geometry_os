; DESCRIPTION: Draws a yellow line from (81, 84) to (37, 58).
; PLAN: r0=81(x1), r1=84(y1), r2=37(x2), r3=58(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 81
LDI r1, 84
LDI r2, 37
LDI r3, 58
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
