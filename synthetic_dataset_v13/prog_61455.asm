; DESCRIPTION: Renders a red line between points (282, 19) and (179, 118).
; PLAN: r0=282(x1), r1=19(y1), r2=179(x2), r3=118(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 282
LDI r1, 19
LDI r2, 179
LDI r3, 118
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
