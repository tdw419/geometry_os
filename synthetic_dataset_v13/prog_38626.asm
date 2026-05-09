; DESCRIPTION: Renders a yellow line between points (99, 141) and (248, 22).
; PLAN: r0=99(x1), r1=141(y1), r2=248(x2), r3=22(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 99
LDI r1, 141
LDI r2, 248
LDI r3, 22
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
