; DESCRIPTION: Renders a red line between points (225, 68) and (38, 106).
; PLAN: r0=225(x1), r1=68(y1), r2=38(x2), r3=106(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 225
LDI r1, 68
LDI r2, 38
LDI r3, 106
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
