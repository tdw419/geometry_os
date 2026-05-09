; DESCRIPTION: Renders a red line between points (165, 75) and (318, 120).
; PLAN: r0=165(x1), r1=75(y1), r2=318(x2), r3=120(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 165
LDI r1, 75
LDI r2, 318
LDI r3, 120
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
