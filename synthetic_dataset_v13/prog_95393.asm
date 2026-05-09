; DESCRIPTION: Places a red line segment connecting (297, 189) to (385, 185).
; PLAN: r0=297(x1), r1=189(y1), r2=385(x2), r3=185(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 297
LDI r1, 189
LDI r2, 385
LDI r3, 185
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
