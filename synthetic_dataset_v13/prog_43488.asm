; DESCRIPTION: Renders a red line between points (339, 125) and (158, 252).
; PLAN: r0=339(x1), r1=125(y1), r2=158(x2), r3=252(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 339
LDI r1, 125
LDI r2, 158
LDI r3, 252
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
