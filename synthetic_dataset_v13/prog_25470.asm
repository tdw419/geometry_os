; DESCRIPTION: Renders a red line between points (75, 212) and (229, 74).
; PLAN: r0=75(x1), r1=212(y1), r2=229(x2), r3=74(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 75
LDI r1, 212
LDI r2, 229
LDI r3, 74
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
