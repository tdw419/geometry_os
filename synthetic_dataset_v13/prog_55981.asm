; DESCRIPTION: Draws a yellow line from (192, 166) to (22, 121).
; PLAN: r0=192(x1), r1=166(y1), r2=22(x2), r3=121(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 192
LDI r1, 166
LDI r2, 22
LDI r3, 121
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
