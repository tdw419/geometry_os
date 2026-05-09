; DESCRIPTION: Renders a red line between points (441, 156) and (349, 218).
; PLAN: r0=441(x1), r1=156(y1), r2=349(x2), r3=218(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 441
LDI r1, 156
LDI r2, 349
LDI r3, 218
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
