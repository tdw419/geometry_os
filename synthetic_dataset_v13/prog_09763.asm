; DESCRIPTION: Renders a red line between points (138, 115) and (192, 158).
; PLAN: r0=138(x1), r1=115(y1), r2=192(x2), r3=158(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 138
LDI r1, 115
LDI r2, 192
LDI r3, 158
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
