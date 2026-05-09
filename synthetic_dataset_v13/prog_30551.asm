; DESCRIPTION: Renders a red line between points (10, 85) and (15, 194).
; PLAN: r0=10(x1), r1=85(y1), r2=15(x2), r3=194(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 10
LDI r1, 85
LDI r2, 15
LDI r3, 194
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
