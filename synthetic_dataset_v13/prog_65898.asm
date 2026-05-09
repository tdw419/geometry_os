; DESCRIPTION: Renders a red line between points (273, 226) and (439, 62).
; PLAN: r0=273(x1), r1=226(y1), r2=439(x2), r3=62(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 273
LDI r1, 226
LDI r2, 439
LDI r3, 62
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
