; DESCRIPTION: Renders a red line between points (3, 200) and (425, 155).
; PLAN: r0=3(x1), r1=200(y1), r2=425(x2), r3=155(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 3
LDI r1, 200
LDI r2, 425
LDI r3, 155
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
