; DESCRIPTION: Draws a yellow line from (68, 181) to (189, 6).
; PLAN: r0=68(x1), r1=181(y1), r2=189(x2), r3=6(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 68
LDI r1, 181
LDI r2, 189
LDI r3, 6
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
