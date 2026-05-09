; DESCRIPTION: Renders a red line between points (80, 8) and (439, 96).
; PLAN: r0=80(x1), r1=8(y1), r2=439(x2), r3=96(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 80
LDI r1, 8
LDI r2, 439
LDI r3, 96
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
