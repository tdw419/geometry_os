; DESCRIPTION: Renders a yellow line between points (156, 122) and (162, 78).
; PLAN: r0=156(x1), r1=122(y1), r2=162(x2), r3=78(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 156
LDI r1, 122
LDI r2, 162
LDI r3, 78
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
