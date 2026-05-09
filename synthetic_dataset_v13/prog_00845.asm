; DESCRIPTION: Renders a red line between points (432, 54) and (475, 97).
; PLAN: r0=432(x1), r1=54(y1), r2=475(x2), r3=97(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 432
LDI r1, 54
LDI r2, 475
LDI r3, 97
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
