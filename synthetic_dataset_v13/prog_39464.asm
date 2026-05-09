; DESCRIPTION: Places a red line segment connecting (359, 106) to (434, 185).
; PLAN: r0=359(x1), r1=106(y1), r2=434(x2), r3=185(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 359
LDI r1, 106
LDI r2, 434
LDI r3, 185
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
