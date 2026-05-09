; DESCRIPTION: Renders a yellow line between points (185, 44) and (162, 85).
; PLAN: r0=185(x1), r1=44(y1), r2=162(x2), r3=85(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 185
LDI r1, 44
LDI r2, 162
LDI r3, 85
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
