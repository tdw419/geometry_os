; DESCRIPTION: Renders a red line between points (275, 162) and (93, 79).
; PLAN: r0=275(x1), r1=162(y1), r2=93(x2), r3=79(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 275
LDI r1, 162
LDI r2, 93
LDI r3, 79
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
