; DESCRIPTION: Renders a red line between points (501, 244) and (185, 3).
; PLAN: r0=501(x1), r1=244(y1), r2=185(x2), r3=3(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 501
LDI r1, 244
LDI r2, 185
LDI r3, 3
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
