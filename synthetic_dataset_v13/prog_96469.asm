; DESCRIPTION: Renders a red line between points (94, 62) and (54, 162).
; PLAN: r0=94(x1), r1=62(y1), r2=54(x2), r3=162(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 94
LDI r1, 62
LDI r2, 54
LDI r3, 162
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
