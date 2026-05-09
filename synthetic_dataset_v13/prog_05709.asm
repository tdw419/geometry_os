; DESCRIPTION: Draws a yellow line from (141, 115) to (22, 121).
; PLAN: r0=141(x1), r1=115(y1), r2=22(x2), r3=121(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 141
LDI r1, 115
LDI r2, 22
LDI r3, 121
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
