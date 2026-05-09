; DESCRIPTION: Renders a red line between points (110, 38) and (124, 175).
; PLAN: r0=110(x1), r1=38(y1), r2=124(x2), r3=175(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 110
LDI r1, 38
LDI r2, 124
LDI r3, 175
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
