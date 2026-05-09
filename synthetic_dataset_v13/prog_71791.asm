; DESCRIPTION: Draws a yellow line from (10, 22) to (181, 136).
; PLAN: r0=10(x1), r1=22(y1), r2=181(x2), r3=136(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 10
LDI r1, 22
LDI r2, 181
LDI r3, 136
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
