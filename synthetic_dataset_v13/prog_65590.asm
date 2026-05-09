; DESCRIPTION: Renders a red line between points (439, 199) and (273, 184).
; PLAN: r0=439(x1), r1=199(y1), r2=273(x2), r3=184(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 439
LDI r1, 199
LDI r2, 273
LDI r3, 184
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
