; DESCRIPTION: Renders a red line between points (34, 25) and (236, 47).
; PLAN: r0=34(x1), r1=25(y1), r2=236(x2), r3=47(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 34
LDI r1, 25
LDI r2, 236
LDI r3, 47
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
