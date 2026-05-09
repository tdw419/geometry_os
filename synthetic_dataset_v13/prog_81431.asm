; DESCRIPTION: Renders a red line between points (251, 165) and (163, 131).
; PLAN: r0=251(x1), r1=165(y1), r2=163(x2), r3=131(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 251
LDI r1, 165
LDI r2, 163
LDI r3, 131
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
