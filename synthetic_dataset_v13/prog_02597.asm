; DESCRIPTION: Draws a yellow line from (106, 78) to (501, 89).
; PLAN: r0=106(x1), r1=78(y1), r2=501(x2), r3=89(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 106
LDI r1, 78
LDI r2, 501
LDI r3, 89
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
