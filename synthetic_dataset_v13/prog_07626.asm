; DESCRIPTION: Renders a red line between points (470, 200) and (232, 97).
; PLAN: r0=470(x1), r1=200(y1), r2=232(x2), r3=97(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 470
LDI r1, 200
LDI r2, 232
LDI r3, 97
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
