; DESCRIPTION: Renders a red line between points (100, 255) and (417, 96).
; PLAN: r0=100(x1), r1=255(y1), r2=417(x2), r3=96(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 100
LDI r1, 255
LDI r2, 417
LDI r3, 96
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
