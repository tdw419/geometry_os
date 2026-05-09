; DESCRIPTION: Renders a red line between points (359, 31) and (13, 20).
; PLAN: r0=359(x1), r1=31(y1), r2=13(x2), r3=20(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 359
LDI r1, 31
LDI r2, 13
LDI r3, 20
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
