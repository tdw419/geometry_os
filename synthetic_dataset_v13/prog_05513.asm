; DESCRIPTION: Renders a red line between points (438, 14) and (266, 212).
; PLAN: r0=438(x1), r1=14(y1), r2=266(x2), r3=212(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 438
LDI r1, 14
LDI r2, 266
LDI r3, 212
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
