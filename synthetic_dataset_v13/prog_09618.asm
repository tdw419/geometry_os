; DESCRIPTION: Renders a red line between points (369, 162) and (56, 76).
; PLAN: r0=369(x1), r1=162(y1), r2=56(x2), r3=76(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 369
LDI r1, 162
LDI r2, 56
LDI r3, 76
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
