; DESCRIPTION: Draws a yellow line from (25, 181) to (501, 191).
; PLAN: r0=25(x1), r1=181(y1), r2=501(x2), r3=191(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 25
LDI r1, 181
LDI r2, 501
LDI r3, 191
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
