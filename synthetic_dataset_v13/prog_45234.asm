; DESCRIPTION: Renders a red line between points (158, 124) and (489, 206).
; PLAN: r0=158(x1), r1=124(y1), r2=489(x2), r3=206(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 158
LDI r1, 124
LDI r2, 489
LDI r3, 206
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
