; DESCRIPTION: Renders a red line between points (80, 171) and (359, 153).
; PLAN: r0=80(x1), r1=171(y1), r2=359(x2), r3=153(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 80
LDI r1, 171
LDI r2, 359
LDI r3, 153
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
