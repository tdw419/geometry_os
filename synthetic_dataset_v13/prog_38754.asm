; DESCRIPTION: Renders a yellow line between points (339, 84) and (121, 127).
; PLAN: r0=339(x1), r1=84(y1), r2=121(x2), r3=127(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 339
LDI r1, 84
LDI r2, 121
LDI r3, 127
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
