; DESCRIPTION: Renders a red line between points (439, 225) and (342, 101).
; PLAN: r0=439(x1), r1=225(y1), r2=342(x2), r3=101(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 439
LDI r1, 225
LDI r2, 342
LDI r3, 101
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
