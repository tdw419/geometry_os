; DESCRIPTION: Places a red line segment connecting (148, 188) to (363, 156).
; PLAN: r0=148(x1), r1=188(y1), r2=363(x2), r3=156(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 148
LDI r1, 188
LDI r2, 363
LDI r3, 156
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
