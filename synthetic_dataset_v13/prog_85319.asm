; DESCRIPTION: Renders a red line between points (489, 170) and (149, 40).
; PLAN: r0=489(x1), r1=170(y1), r2=149(x2), r3=40(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 489
LDI r1, 170
LDI r2, 149
LDI r3, 40
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
