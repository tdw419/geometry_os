; DESCRIPTION: Draws a green line from (121, 58) to (147, 3).
; PLAN: r0=121(x1), r1=58(y1), r2=147(x2), r3=3(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 121
LDI r1, 58
LDI r2, 147
LDI r3, 3
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
