; DESCRIPTION: Renders a red line between points (47, 233) and (252, 15).
; PLAN: r0=47(x1), r1=233(y1), r2=252(x2), r3=15(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 47
LDI r1, 233
LDI r2, 252
LDI r3, 15
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
