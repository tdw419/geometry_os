; DESCRIPTION: Renders a yellow line between points (147, 226) and (468, 23).
; PLAN: r0=147(x1), r1=226(y1), r2=468(x2), r3=23(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 147
LDI r1, 226
LDI r2, 468
LDI r3, 23
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
