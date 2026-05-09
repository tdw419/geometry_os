; DESCRIPTION: Renders a red line between points (40, 16) and (359, 98).
; PLAN: r0=40(x1), r1=16(y1), r2=359(x2), r3=98(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 40
LDI r1, 16
LDI r2, 359
LDI r3, 98
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
