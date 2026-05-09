; DESCRIPTION: Draws a yellow line from (121, 50) to (175, 155).
; PLAN: r0=121(x1), r1=50(y1), r2=175(x2), r3=155(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 121
LDI r1, 50
LDI r2, 175
LDI r3, 155
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
