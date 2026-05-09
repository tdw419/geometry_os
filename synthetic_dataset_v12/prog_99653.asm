; DESCRIPTION: Renders a red line between points (241, 218) and (80, 18).
; PLAN: r0=241(x1), r1=218(y1), r2=80(x2), r3=18(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 241
LDI r1, 218
LDI r2, 80
LDI r3, 18
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
