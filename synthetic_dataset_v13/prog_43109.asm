; DESCRIPTION: Renders a yellow line between points (287, 99) and (188, 106).
; PLAN: r0=287(x1), r1=99(y1), r2=188(x2), r3=106(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 287
LDI r1, 99
LDI r2, 188
LDI r3, 106
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
