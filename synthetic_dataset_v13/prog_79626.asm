; DESCRIPTION: Renders a red line between points (432, 84) and (231, 106).
; PLAN: r0=432(x1), r1=84(y1), r2=231(x2), r3=106(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 432
LDI r1, 84
LDI r2, 231
LDI r3, 106
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
