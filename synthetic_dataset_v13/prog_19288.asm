; DESCRIPTION: Renders a red line between points (439, 104) and (306, 45).
; PLAN: r0=439(x1), r1=104(y1), r2=306(x2), r3=45(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 439
LDI r1, 104
LDI r2, 306
LDI r3, 45
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
