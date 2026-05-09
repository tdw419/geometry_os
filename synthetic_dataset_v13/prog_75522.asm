; DESCRIPTION: Renders a red line between points (475, 115) and (158, 52).
; PLAN: r0=475(x1), r1=115(y1), r2=158(x2), r3=52(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 475
LDI r1, 115
LDI r2, 158
LDI r3, 52
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
