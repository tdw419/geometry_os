; DESCRIPTION: Renders a red line between points (423, 162) and (176, 101).
; PLAN: r0=423(x1), r1=162(y1), r2=176(x2), r3=101(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 423
LDI r1, 162
LDI r2, 176
LDI r3, 101
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
