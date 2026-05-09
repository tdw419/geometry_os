; DESCRIPTION: Renders a red line between points (226, 30) and (45, 135).
; PLAN: r0=226(x1), r1=30(y1), r2=45(x2), r3=135(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 226
LDI r1, 30
LDI r2, 45
LDI r3, 135
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
