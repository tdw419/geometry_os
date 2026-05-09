; DESCRIPTION: Renders a red line between points (253, 208) and (484, 217).
; PLAN: r0=253(x1), r1=208(y1), r2=484(x2), r3=217(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 253
LDI r1, 208
LDI r2, 484
LDI r3, 217
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
