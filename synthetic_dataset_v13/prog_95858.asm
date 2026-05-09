; DESCRIPTION: Renders a red line between points (75, 90) and (61, 252).
; PLAN: r0=75(x1), r1=90(y1), r2=61(x2), r3=252(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 75
LDI r1, 90
LDI r2, 61
LDI r3, 252
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
