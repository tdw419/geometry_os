; DESCRIPTION: Draws a yellow line from (359, 158) to (40, 16).
; PLAN: r0=359(x1), r1=158(y1), r2=40(x2), r3=16(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 359
LDI r1, 158
LDI r2, 40
LDI r3, 16
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
