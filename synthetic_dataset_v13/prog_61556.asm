; DESCRIPTION: Renders a red line between points (80, 172) and (342, 157).
; PLAN: r0=80(x1), r1=172(y1), r2=342(x2), r3=157(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 80
LDI r1, 172
LDI r2, 342
LDI r3, 157
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
