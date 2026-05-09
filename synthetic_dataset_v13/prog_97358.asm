; DESCRIPTION: Renders a yellow line between points (79, 252) and (505, 216).
; PLAN: r0=79(x1), r1=252(y1), r2=505(x2), r3=216(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 79
LDI r1, 252
LDI r2, 505
LDI r3, 216
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
