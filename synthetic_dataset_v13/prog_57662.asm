; DESCRIPTION: Renders a red line between points (26, 142) and (508, 217).
; PLAN: r0=26(x1), r1=142(y1), r2=508(x2), r3=217(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 26
LDI r1, 142
LDI r2, 508
LDI r3, 217
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
