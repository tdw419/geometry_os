; DESCRIPTION: Renders a red line between points (321, 38) and (300, 22).
; PLAN: r0=321(x1), r1=38(y1), r2=300(x2), r3=22(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 321
LDI r1, 38
LDI r2, 300
LDI r3, 22
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
