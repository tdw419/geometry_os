; DESCRIPTION: Renders a yellow line between points (99, 118) and (105, 95).
; PLAN: r0=99(x1), r1=118(y1), r2=105(x2), r3=95(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 99
LDI r1, 118
LDI r2, 105
LDI r3, 95
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
