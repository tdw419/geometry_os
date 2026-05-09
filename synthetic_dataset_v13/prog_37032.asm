; DESCRIPTION: Renders a red line between points (315, 33) and (162, 185).
; PLAN: r0=315(x1), r1=33(y1), r2=162(x2), r3=185(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 315
LDI r1, 33
LDI r2, 162
LDI r3, 185
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
