; DESCRIPTION: Places a red line segment connecting (359, 169) to (286, 120).
; PLAN: r0=359(x1), r1=169(y1), r2=286(x2), r3=120(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 359
LDI r1, 169
LDI r2, 286
LDI r3, 120
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
