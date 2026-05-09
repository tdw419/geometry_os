; DESCRIPTION: Renders a yellow line between points (312, 22) and (248, 94).
; PLAN: r0=312(x1), r1=22(y1), r2=248(x2), r3=94(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 312
LDI r1, 22
LDI r2, 248
LDI r3, 94
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
