; DESCRIPTION: Renders a red line between points (136, 233) and (221, 200).
; PLAN: r0=136(x1), r1=233(y1), r2=221(x2), r3=200(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 136
LDI r1, 233
LDI r2, 221
LDI r3, 200
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
