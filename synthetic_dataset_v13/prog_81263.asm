; DESCRIPTION: Renders a red line between points (236, 26) and (314, 98).
; PLAN: r0=236(x1), r1=26(y1), r2=314(x2), r3=98(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 236
LDI r1, 26
LDI r2, 314
LDI r3, 98
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
