; DESCRIPTION: Renders a red line between points (136, 251) and (475, 106).
; PLAN: r0=136(x1), r1=251(y1), r2=475(x2), r3=106(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 136
LDI r1, 251
LDI r2, 475
LDI r3, 106
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
