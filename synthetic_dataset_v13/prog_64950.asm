; DESCRIPTION: Renders a yellow line between points (99, 252) and (4, 181).
; PLAN: r0=99(x1), r1=252(y1), r2=4(x2), r3=181(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 99
LDI r1, 252
LDI r2, 4
LDI r3, 181
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
