; DESCRIPTION: Renders a red line between points (233, 179) and (472, 30).
; PLAN: r0=233(x1), r1=179(y1), r2=472(x2), r3=30(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 233
LDI r1, 179
LDI r2, 472
LDI r3, 30
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
