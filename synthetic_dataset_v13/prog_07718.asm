; DESCRIPTION: Renders a green line between points (505, 118) and (462, 22).
; PLAN: r0=505(x1), r1=118(y1), r2=462(x2), r3=22(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 505
LDI r1, 118
LDI r2, 462
LDI r3, 22
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
