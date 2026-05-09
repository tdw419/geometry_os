; DESCRIPTION: Places a yellow line segment connecting (121, 106) to (457, 136).
; PLAN: r0=121(x1), r1=106(y1), r2=457(x2), r3=136(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 121
LDI r1, 106
LDI r2, 457
LDI r3, 136
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
