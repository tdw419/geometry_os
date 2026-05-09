; DESCRIPTION: Places a red line segment connecting (185, 188) to (78, 93).
; PLAN: r0=185(x1), r1=188(y1), r2=78(x2), r3=93(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 185
LDI r1, 188
LDI r2, 78
LDI r3, 93
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
