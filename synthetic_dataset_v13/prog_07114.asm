; DESCRIPTION: Renders a red line between points (1, 227) and (21, 106).
; PLAN: r0=1(x1), r1=227(y1), r2=21(x2), r3=106(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 1
LDI r1, 227
LDI r2, 21
LDI r3, 106
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
