; DESCRIPTION: Draws a red line from (200, 55) to (169, 139).
; PLAN: r0=200(x1), r1=55(y1), r2=169(x2), r3=139(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 200
LDI r1, 55
LDI r2, 169
LDI r3, 139
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
